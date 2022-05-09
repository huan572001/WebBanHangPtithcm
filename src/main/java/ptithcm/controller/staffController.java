package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.*;

import java.text.SimpleDateFormat;

@Controller
public class staffController {
	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping("User")
	public String order(ModelMap mm) {
		if(loginController.account.getUsername()==null)
		{
			return"login";
		}
		System.out.print(loginController.account.getPosition());
		Session session = factory.getCurrentSession();
		String hql = "from Staff";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		mm.addAttribute("Staff", list);
		return "Staff/Staff";
	}
	
	@RequestMapping(value="SearchPhoneStaff", method=RequestMethod.POST)
	public String SearchPhoneStaff(ModelMap mm,HttpServletRequest request) {
		String phone = request.getParameter("phone"); 
		Session session = factory.openSession();
		String hql = "from Staff a where a.phone='"+phone+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		mm.addAttribute("Staff", list);
		return "Staff/Staff";
	}
	@RequestMapping(value="insertStaff", method=RequestMethod.GET)
	public String insertStaff(ModelMap model) {
		if(loginController.account.getPosition().equals("KH"))
			return "khachhang";
		if(loginController.account.getPosition().equals("NV")) {
			model.addAttribute("messageAD","Báº¡n KhÃ´ng Pháº£i Quáº£n LÃ­ KhÃ´ng Sá»­ Dá»¥ng Ä�Æ°á»£c Chá»©c NÄƒng NÃ y");
			return"redirect:profile.htm";
		}
			
		model.addAttribute("staff", new Staff());
		return "Staff/insert";
	}

	@RequestMapping(value="insertStaff", method = RequestMethod.POST)
	public String insertStaff(ModelMap model, @ModelAttribute("staff") Staff staff,HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		staff.setStaffId(this.createStaffId());
		staff.setStatus(true);
		staff.setUsername(staff.getEmail());
		String birthday=request.getParameter("birthday1");
		Account account = new Account();
		account.setUsername(staff.getEmail());
		account.setPassword(staff.getStaffId());
		account.setPosition("NV");
		String hql = "FROM Account";
		Query query = session.createQuery(hql);
		List<Account> listAccount = query.list();
		
		for(Account t1 : listAccount)
		{
			
			if(t1.getUsername().trim().equals(account.getUsername().trim()))
			{
				model.addAttribute("message1", "Email Ä‘Ã£ tá»“n táº¡i");
				return "Staff/insert";
			}
			
		}	
		if (this.checkConstraintForm(staff, model)) return "Staff/insert";
		try {		
			staff.setBirthday(this.dateFormat(birthday));	
			this.insertAccount(account);
			session.save(staff);
			t.commit();
			model.addAttribute("message", "Create Successful Product");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Product Creation Failed");
		}
		finally {
			session.close();
			
		}
		return "Staff/insert";
	}

		

	@RequestMapping(value="update-{staffId}.htm", method=RequestMethod.GET)
	public String updateNV(ModelMap modelNV,@PathVariable("staffId") String staffId) {
		
		modelNV.addAttribute("staff", this.getCurrentStaff(staffId));
		return "Staff/update";
		
	}

	@RequestMapping(value="update-{staffId}.htm", method=RequestMethod.POST)
	public String updateNV(ModelMap modelNV, @ModelAttribute("staff") Staff staff) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		staff.setUsername(this.getCurrentUsername(staff.getStaffId()));
		if (this.checkConstraintForm(staff, modelNV)) return "Staff/update";
		try {
			session.update(staff);
			t.commit();
			modelNV.addAttribute("message", "Cáº­p nháº­t thÃ nh cÃ´ng!");
		}
		catch (Exception e) {
			t.rollback();
			modelNV.addAttribute("message", "Cáº­p nháº­t tháº¥t báº¡i!");
		}
		finally {
			session.close();
		}
		return "Staff/update";
	}
	public void insertAccount(Account account)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(account);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	public List<Account> allAccount()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Account";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		return list;
	}
	
	public Integer getLastStaffId()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(staffId AS int)) from Staff";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer id=list.get(0);
		return id;
	}
	public String createStaffId()
	{
		Integer id=getLastStaffId();
		if(id==null)
		{
			id=1;
		}
		else
		{
			id+=1;
		}
		return id.toString();
	}
	public String getCurrentUsername(String Id) {
		Session session = factory.openSession();
		String hql = "from Staff A where A.staffId= '"+Id+"'";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		String Username =list.get(0).getUsername();
		return Username;
	}
	public Date dateFormat(String day)throws Exception {
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(day);
		return date;
	}
	public Staff getCurrentStaff(String staffId) {
		Session session = factory.openSession();
		String hql = "from Staff A where A.staffId= '"+staffId+"'";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		if(list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}
	public Boolean checkConstraintForm(Staff staff,ModelMap model) {

		if(staff.getFullname().isEmpty()||staff.getPhone().isEmpty()||staff.getEmail().isEmpty()||staff.getAddress().isEmpty()||staff.getGender()==null) {

			model.addAttribute("messageError","KhÃ´ng duoc de trong!");
			return true;
		}
		return false;
	}
}