package ptithcm.controller;

import java.security.NoSuchAlgorithmException;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ptithcm.entity.*;
@Controller
@Transactional
public class changePasswordController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value="changePassword")
	public String index2(ModelMap model)
	{
		model.addAttribute("account", loginController.account);
		return "admin/changePassword";
	}
	
	
	@RequestMapping(value="changePassword",method = RequestMethod.POST)
	public String doimk(ModelMap model,@RequestParam("oldpassword") String oldpass,
			@RequestParam("NewPassword") String newpass,@RequestParam("Reppassword") String reppass) {
		if(oldpass.isEmpty()||reppass.isEmpty()) {
			model.addAttribute("message", "Khong duoc de trong!");
			return "admin/changePassword";
		}
		if(oldpass.equals(loginController.account.getPassword())) {
			if(!newpass.equals(reppass)) {
				model.addAttribute("account", loginController.account);
				model.addAttribute("message", "mật khẩu xác nhận chưa chính xác");
				return "admin/changePassword";
			}		
		}
		else
		{
			model.addAttribute("tk", loginController.account);
			model.addAttribute("message", "mat khau chua chính xác");
			return "admin/changePassword";
		}
		loginController.account.setPassword(newpass);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(loginController.account);
			t.commit();
			model.addAttribute("message", "thanh cong!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "that bai!");
		}
		finally {
			session.close();
		}
		
		this.updateAccotunt(model,loginController.account);
		return "admin/changePassword";
//		return "redirect:profile.htm";
	}
	public void updateAccotunt(ModelMap model,Account a){
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(a);
			t.commit();
			model.addAttribute("message", "thanh cong!");
			
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "that bai!");
		}
		finally {
			session.close();
		}
	}
}
