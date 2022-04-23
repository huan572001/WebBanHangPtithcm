package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Customer;
import ptithcm.entity.Receipt;
@Controller
public class customerController {
	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping("Customer")
	public String customer(ModelMap mm) {
		Session session = factory.getCurrentSession();
		String hql = "from Customer";
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		mm.addAttribute("Customer", list);
		return "Customer";
	}
	@RequestMapping(value="SearchPhoneCustomer", method=RequestMethod.POST)
	public String SearchPhoneCustomer(ModelMap mm,HttpServletRequest request) {
		String phone = request.getParameter("phone"); 
		Session session = factory.openSession();
		String hql = "from Customer a where a.phone='"+phone+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		mm.addAttribute("Customer", list);
		return "Customer";
	}
}
