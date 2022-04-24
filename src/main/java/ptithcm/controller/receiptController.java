package ptithcm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import ptithcm.entity.ReceiptDetails;
import ptithcm.entity.Product;
import ptithcm.entity.Receipt;
@Controller
public class receiptController {
	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping("Receipt")
	public String receipt(ModelMap mm) {
		Session session = factory.getCurrentSession();
		String hql = "from Receipt";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		mm.addAttribute("Receipt", list);
		return "Receipt/index";
	}
	@RequestMapping(value="ReceiptSearchDate", method=RequestMethod.POST)
	public String receiptSearchDate(ModelMap mm,HttpServletRequest request) {
		String sinceDay = request.getParameter("sinceDay"); 
		String toTheDay = request.getParameter("toTheDay");
		Session session = factory.openSession();
		String hql = "from Receipt a where a.date>'"+sinceDay+"' and a.date<'"+toTheDay+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		mm.addAttribute("Receipt", list);
		return "Receipt/index";
	}
	@RequestMapping(value="ReceiptSearchCustomer", method=RequestMethod.POST)
	public String receiptSearchCustomer(ModelMap mm,HttpServletRequest request) {
		String customer = request.getParameter("customer"); 
		Session session = factory.openSession();
		String hql = "from Receipt a where a.customerId='"+customer+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		mm.addAttribute("Receipt", list);
		return "Receipt/index";
	}
	@Transactional
	@RequestMapping("details-{Id}")
	public String receiptDetails(ModelMap model, @PathVariable("Id") String Id) {
		Session session = factory.getCurrentSession();
		String hql="from ReceiptDetails A where A.receiptId="+"'"+Id+"'" ;
		Query query = session.createQuery(hql);
		List<ReceiptDetails> list = query.list();
		model.addAttribute("ReceiptDetails", list);
		return "Receipt/details";
	}
}
