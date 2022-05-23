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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Customer;
import ptithcm.entity.Receipt;
import ptithcm.entity.ReceiptDetails;
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
		return "Customer/Customer";
	}
	@RequestMapping(value="SearchPhoneCustomer", method=RequestMethod.POST)
	public String SearchPhoneCustomer(ModelMap mm,HttpServletRequest request) {
		String phone = request.getParameter("phone"); 
		Session session = factory.openSession();
		String hql = "from Customer a where a.phone LIKE '"+phone+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		mm.addAttribute("Customer", list);
		return "Customer/Customer";
	}
	@Transactional
	@RequestMapping("purchaseOrder-{Id}")
	public String purchaseOrder(ModelMap mm, @PathVariable("Id") String Id) {
		Session session = factory.openSession();
		String hql = "from Receipt A where A.customerId='"+Id+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
	
		mm.addAttribute("purchaseOrder", list);
		return "Customer/purchaseOrder";
	}
	@Transactional
	@RequestMapping("detailsPurchaseOrder-{Id1}")
	public String receiptDetails(ModelMap model, @PathVariable("Id1") String Id1) {
		Session session = factory.getCurrentSession();
		String hql="from ReceiptDetails A where A.receipt.receiptId="+"'"+Id1+"'" ;
		Query query = session.createQuery(hql);
		List<ReceiptDetails> list = query.list();
		model.addAttribute("detailsPurchaseOrder", list);
		return "Customer/detailsPurchaseOrder";
	}
	
}
