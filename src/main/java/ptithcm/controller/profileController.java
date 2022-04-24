package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import ptithcm.entity.Staff;

@Controller
public class profileController {
	@Autowired
	SessionFactory factory;
	@Transactional
	@RequestMapping("profile")
	public String profile(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hqlaccount="from Staff A where A.username="+"'"+loginController.account.getUsername()+"'";
		Query queryaccount = session.createQuery(hqlaccount);
		List<Staff> liststaff = queryaccount.list();
		model.addAttribute("Staff", liststaff);
		return "Profile/Profile";
	}
	
	@RequestMapping(value="updateCurrent-{staffId}.htm", method=RequestMethod.GET)
	public String updateCurrentStaff(ModelMap model) {
		model.addAttribute("profile", new Staff());
		return "Profile/update";
	}

	@RequestMapping(value="updateCurrent-{staffId}.htm", method=RequestMethod.POST)
	public String updateCurrentStaff(ModelMap model, @ModelAttribute("profile") Staff profile) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(profile);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại!");
		}
		finally {
			session.close();
		}
		return "Profile/update";
	}
}

