package ptithcm.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
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
@RequestMapping("/staff/")
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
			model.addAttribute("message", "cannot be left blank !");
			return "admin/changePassword";
		}
		if(this.digest(oldpass).equals(loginController.account.getPassword())) {
			if(!newpass.equals(reppass)) {
				model.addAttribute("account", loginController.account);
				model.addAttribute("message", "Confirmation password is incorrect !");
				return "admin/changePassword";
			}		
		}
		else
		{
			model.addAttribute("tk", loginController.account);
			model.addAttribute("message", "Password is incorrect !");
			return "admin/changePassword";
		}
		
		loginController.account.setPassword(this.digest(newpass));
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(loginController.account);
			t.commit();
			model.addAttribute("message", "successful!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "failed!");
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
			model.addAttribute("message", "successful!");
			
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "failed!");
		}
		finally {
			session.close();
		}
	}
	public static String digest(String pass) {
    	byte[] input=pass.getBytes(StandardCharsets.UTF_8);
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA3-256");
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalArgumentException(e);
        }
        byte[] result = md.digest(input);
        StringBuilder sb = new StringBuilder();
        for (byte b : result) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
