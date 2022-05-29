package ptithcm.controller;

import java.util.Date;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;

import java.text.SimpleDateFormat;

import ptithcm.entity.Customer;
import ptithcm.entity.Staff;

@Controller
@RequestMapping("/staff/")
public class profileController {
	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping("profile")	
	public String profile(ModelMap model) {
		model.addAttribute("Staff", this.getCurrentProfile());
		model.addAttribute("ADMIN", loginController.checkMenu());
		return "Profile/Profile";
	}
	@RequestMapping(value = "updateCurrent-{staffId}.htm", method = RequestMethod.GET)
	public String updateCurrentStaff(ModelMap model, @PathVariable("staffId") String staffId) {
		model.addAttribute("profile", this.getCurrentProfile());
		return "Profile/update";
	}

	@RequestMapping(value = "updateCurrent-{staffId}.htm", method = RequestMethod.POST)
	public String updateCurrentStaff(ModelMap model, @ModelAttribute("profile") Staff profile,HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		profile.setUsername(this.getCurrentUsername(profile.getStaffId()));
		profile.setStatus(this.getCurrentStatus(profile.getStaffId()));
		String birthday=request.getParameter("birthday1");
		if(this.CheckEmail(profile.getEmail())) {
			model.addAttribute("message", "Email da bi trung!");
			return "Profile/update";
		}
		if (this.checkConstraintForm(profile, model)) return "Profile/update";
		try {
			if(birthday.isEmpty()||birthday==null) {
				profile.setBirthday(this.getCurrentProfile().getBirthday());
			}else {
				profile.setBirthday(this.dateFormat(birthday));
			}
			session.update(profile);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại!");
		} finally {
			session.close();
		}
		return "Profile/update";
	}

	public String getCurrentUsername(String Id) {
		Session session = factory.openSession();
		String hql = "from Staff A where A.staffId= '" + Id + "'";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		String Username = list.get(0).getUsername();
		return Username;
	}

	public Boolean getCurrentStatus(String Id) {
		Session session = factory.openSession();
		String hql = "from Staff A where A.staffId= '" + Id + "'";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		Boolean Status = list.get(0).getStatus();
		return Status;
	}

	public Date dateFormat(String day)throws Exception {
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(day);
		return date;
	}
	public Staff getCurrentProfile() {
		Session session = factory.openSession();
		String hqlaccount = "from Staff A where A.username=" + "'" + loginController.account.getUsername() + "'";
		Query queryaccount = session.createQuery(hqlaccount);
		List<Staff> liststaff = queryaccount.list();
		if(liststaff.isEmpty()) {
			return null;
		}
		return liststaff.get(0);
	}
	public Boolean checkConstraintForm(Staff staff,ModelMap model) {
		if(staff.getFullname().isEmpty()||staff.getPhone().isEmpty()||staff.getEmail().isEmpty()||staff.getAddress().isEmpty()||staff.getGender()==null) {
			model.addAttribute("messageError","Không duoc de trong!");
			return true;
		}
		return false;
	}
	public Boolean CheckEmail(String email) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM Staff a where a.email='"+email+"'";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		if(list.isEmpty()) return true;
		return false;
	}
}
