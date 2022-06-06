package ptithcm.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import ptithcm.entity.Staff;

@Controller
public class registerController {
	@Autowired
	SessionFactory factory;

	@RequestMapping(value = "insertCustomer", method = RequestMethod.GET)
	public String insertStaff(ModelMap model) {
		model.addAttribute("customer", new Customer());
		return "register";
	}

	@RequestMapping(value = "insertCustomer", method = RequestMethod.POST)
	public String insertStaff(ModelMap model, @ModelAttribute("customer") Customer customer) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (customer.getAccount().getUsername().isEmpty() || customer.getAccount().getPassword().isEmpty()
				|| customer.getFullname().isEmpty() || customer.getPhone().isEmpty()||customer.getEmail().isEmpty()) {
			model.addAttribute("message1", "Not be empty!");
			return "register";

		}

		if(this.CheckUsernameAccount(customer.getAccount().getUsername())) {
			model.addAttribute("message1", "Tai khoan da ton tai!");
			return "register";
		}
		if(this.CheckEmail(customer.getEmail())) {
			model.addAttribute("Email", "Email is duplicated!");
			return "register";
		}
		customer.getAccount().setPassword(this.digest(customer.getAccount().getPassword()));
		
		Account account= new Account();
		account.setPosition("KH");
		account.setUsername(customer.getAccount().getUsername());
		account.setPassword(customer.getAccount().getPassword());
		customer.setCustomerId(this.createCustomerId());
		customer.setAccount(account);
		try {
			session.save(account);
			session.save(customer);
			
			t.commit();
			model.addAttribute("message", "Successful");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "failed!");
		} finally {
			session.close();

		}
		return "register";
	}

	public Integer getLastCustomerId() {
		Session session = factory.openSession();
		String hql = "select max( CAST(customerId AS int)) from Customer";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer id = list.get(0);
		return id;
	}

	public String createCustomerId() {
		Integer id = getLastCustomerId();
		if (id == null) {
			id = 1;
		} else {
			id += 1;
		}
		return id.toString();
	}
	public Boolean CheckEmail(String email) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM Customer a where a.email='"+email+"'";
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		if(!list.isEmpty()) return true;
		return false;
	}
	public Boolean CheckUsernameAccount(String username) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM Account a where a.username='"+username+"'";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		if(!list.isEmpty()) {
			return true;
		}
		return false;
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
