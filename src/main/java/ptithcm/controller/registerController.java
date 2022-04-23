package ptithcm.controller;

import java.util.List;

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

import ptithcm.entity.Account;
import ptithcm.entity.Customer;
@Controller
public class registerController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value="insertCustomer", method=RequestMethod.GET)
	public String insertStaff(ModelMap model) {
		model.addAttribute("customer", new Customer());
		model.addAttribute("account", new Account());
		return "register";
	}
	@RequestMapping(value="insertCustomer", method=RequestMethod.POST)
	public String insertStaff(ModelMap model, @ModelAttribute("customer") Customer customer,@ModelAttribute("account") Account account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		account.setPosition("KH");
		account.setUsername(customer.getAccount().getUsername());
		account.setPassword(customer.getAccount().getPassword());
		String hql = "FROM Account";
		Query query = session.createQuery(hql);
		List<Account> listAccount = query.list();
		
		String hqlCustomer = "FROM Customer";
		Query queryCustomer = session.createQuery(hqlCustomer);
		List<Customer> listCustomer = queryCustomer.list();
		for(Account t1 : listAccount)
		{
			
			if(t1.getUsername().trim().equals(account.getUsername().trim()))
			{
				model.addAttribute("message1", "Tài Khoản đã tồn tại");
				return "register";
			}
			
		}
		for(Customer t1 : listCustomer)
		{	
			if(t1.getEmail().trim().equals(customer.getEmail().trim()))
			{
				model.addAttribute("Email", "Email da ton tai");
				return "register";
			}
			
		}

		try {
			session.save(customer);
			session.save(account);
			t.commit();
			model.addAttribute("message", "Thêm Thành công");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm Thất bại");
		}
		finally {
			session.close();
			
		}
		return "register";
	}
}
