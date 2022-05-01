package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ptithcm.entity.*;

@Controller
public class loginController {
	@Autowired
	SessionFactory factory;
	public static Account account = new Account();
	public static Staff staff=new Staff();

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String showForm() {
		return "login";
	}

	@Transactional
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String saveData(HttpServletRequest request, ModelMap model) {
		account.setPassword(request.getParameter("password"));
		account.setUsername(request.getParameter("username"));
		Session session = factory.getCurrentSession();
		String hql = "from Account";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		
		
		
		for (Account Account : list) {
			System.out.print(Account.getUsername());
			if (Account.getUsername().equals(account.getUsername())) {
				if (Account.getPassword().equals(account.getPassword()) == false) {
					model.addAttribute("message", "sai mat khau");
					return "login";
				} else {
					if (Account.getPosition().equals("AD")) {
						account = Account;
						String hqlaccount="from Staff A where A.username="+"'"+account.getUsername()+"'";
						Query queryaccount = session.createQuery(hqlaccount);
						List<Staff> liststaff = queryaccount.list();
						staff=liststaff.get(0);
						model.addAttribute("Staff", liststaff);
						return "redirect:profile.htm";//không được sửa
					}
					else if(Account.getPosition().equals("NV")) {
						account = Account;
						String hqlaccount="from Staff A where A.username="+"'"+account.getUsername()+"'";
						Query queryaccount = session.createQuery(hqlaccount);
						List<Staff> liststaff = queryaccount.list();
						staff=liststaff.get(0);
						return "redirect:profile.htm";//không được sửa
					}
					else if(Account.getPosition().equals("KH")) {
						
						return "tuan";
					}
					else {
						model.put("message", "account hoac mk sai");
						account= new Account();
						return "login";
					}
				}

			}
		}
		model.put("message", "account hoac mk sai");
		return "login";
	}
	public static String checkAccount() {
		if(loginController.account.getPassword()==null)
			return "login";
		return null;
	}
	public static String checkAccountPosition() {
		return loginController.account.getPosition();
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		loginController.account.setUsername(null);
		loginController.account.setPassword(null);
		loginController.account.setPosition(null);
		return "redirect:login.htm";
	}
	public static String checkMenu() {
		if(loginController.account.getPosition().equals("NV"))
		return "style='display: none'";
		return "";
	}
}
