package ptithcm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String saveData(HttpServletRequest request,HttpServletResponse response, ModelMap model, HttpSession httpsession) throws IOException  {
		account.setPassword(request.getParameter("password"));
		account.setUsername(request.getParameter("username"));
		Session session = factory.getCurrentSession();
		String hql = "from Account";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		
		
		
		for (Account Account : list) {
			if (Account.getUsername().equals(account.getUsername())) {
				if (Account.getPassword().equals(account.getPassword()) == false) {		
					model.addAttribute("message", "sai mat khau");
					return "login";
				} else if(!this.findByUsernameStaff(account.getUsername()).getStatus()) {
					model.addAttribute("message", "Tai khoan da bi huy!");
					return "login";
				}
				else {
					
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
						
						saveLogin(request,response,model,httpsession);
						return "redirect:homeStore.htm";
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
	public void  saveLogin(HttpServletRequest request,HttpServletResponse response, ModelMap model, HttpSession httpsession) throws IOException {
		Customer customer = findByUsername( request.getParameter("username").toString());
		httpsession.setAttribute("currentUser", customer);
		httpsession.setAttribute("fullname", customer.getFullname());
		if(request.getParameter("remember")!=null) {
			 //4. save cookies
			Cookie cookieUname = new Cookie("cookUname", request.getParameter("username"));
			Cookie cookiePass = new Cookie("cookPass", request.getParameter("password"));
			Cookie cookieReme = new Cookie("cookReme",request.getParameter("remember"));
			cookieUname.setMaxAge(100);
			response.addCookie(cookieUname);
			
			cookiePass.setMaxAge(100);
			response.addCookie(cookiePass);
			cookieReme.setMaxAge(100);
			response.addCookie(cookieReme);
		}
		 
		
		
	}
	public Customer findByUsername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "from Customer A where A.account.username="+"'"+username+"'";
		Query query = session.createQuery(hql);
		Customer result = new Customer();
		result= (Customer) query.list().get(0);
		return result;
		
    }
	public Staff findByUsernameStaff(String username) {
		Session session = factory.getCurrentSession();
		String hql = "from Staff A where A.username="+"'"+username+"'";
		Query query = session.createQuery(hql);
		Staff result = new Staff();
		result= (Staff) query.list().get(0);
		return result;
		
    }
}
