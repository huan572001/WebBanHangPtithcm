package ptithcm.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Cart;
import ptithcm.entity.*;
@Controller
public class homeStoreController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "homeStore", method = RequestMethod.GET)
	public String showForm(HttpSession httpsession,ModelMap model) {
		Session session = factory.openSession();
		String hql = "from Product p where p.status='true'";
		Query query = session.createQuery(hql);
		List<Product> listProducts = query.list();
		model.addAttribute("listProducts", listProducts);
//		model.addAttribute("lastProduct", getLastProduct()) ;
		return "shop/home";
	}
	@RequestMapping(value = "search_page", method = RequestMethod.GET)
	public String searchpage(HttpSession httpsession,ModelMap model) {

//		model.addAttribute("lastProduct", getLastProduct()) ;
		return "shop/search_page";
	}
	@RequestMapping(value = "orders", method = RequestMethod.GET)
	public String orders(HttpSession httpsession,ModelMap modelMap) {
		Customer customer = (Customer) httpsession.getAttribute("currentUser");
		if (customer == null) {
			return "redirect:login.htm";
		}
	
		List<TheOrder> yourOrders = yourOrders(customer.getCustomerId()); 
		
		httpsession.setAttribute("yourOrders", yourOrders);
		return "shop/orders";
	}


	@RequestMapping(value = "profileCustomer", method = RequestMethod.GET)
	public  String viewProfile(HttpServletRequest request,ModelMap modelMap, HttpSession httpsession) {
		Customer customer = (Customer) httpsession.getAttribute("currentUser");
		modelMap.addAttribute("proName",customer.getFullname());
		modelMap.addAttribute("proPhone",customer.getPhone());
		modelMap.addAttribute("proEmail", customer.getEmail());
		return"shop/profile";
		
	}
	@RequestMapping(value = "changeProfile", method = RequestMethod.POST)
	public String changeProfile(ModelMap model,HttpServletRequest request,HttpSession httpsession) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Customer customer = (Customer) httpsession.getAttribute("currentUser");
		customer.setFullname(request.getParameter("profileName"));
		customer.setPhone(request.getParameter("profilePhone"));
		customer.setEmail(request.getParameter("profileEmail"));
		try {
			httpsession.setAttribute("currentUser", customer);
			session.update(customer);
			t.commit();
			
			model.addAttribute("message", "Update successful");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Update failed!");
		} finally {
			session.close();
		}
		return"redirect:homeStore.htm";
	}

	@RequestMapping(value = "about", method = RequestMethod.GET)
	public  String about() {
		
			return "shop/about";
		
	}


	public  String listProductOrderDetails (String id) {
		Session session = factory.openSession();
		String hql = "from OrderDetails p where p.orderId='"+id+"'";
		 Query query = session.createQuery(hql);
		 List<OrderDetails> list= query.list();
		 String product = new String();
		 for (OrderDetails orderDetails : list) {
			product+=orderDetails.getProduct().getName()+" ("+Integer.toString(orderDetails.getQuantity())+"X"+Float.toString(orderDetails.getProduct().getPrice())+")	";
		}
		
		 return product;
	}
	public  List<TheOrder> yourOrders (String customerId) {
		Session session = factory.openSession();
		String hql = "from TheOrder p where p.customer.customerId='"+customerId+"'";
		 Query query = session.createQuery(hql);
			return query.list();
		
	}
	public  float totalPrice (String id) {
		Session session = factory.openSession();
		String hql = "from OrderDetails p where p.orderId='"+id+"'";
		 Query query = session.createQuery(hql);
		 List<OrderDetails> list= query.list();
		 float total = 0 ;
		 for (OrderDetails orderDetails : list) {
			 total+=orderDetails.getQuantity()*orderDetails.getProduct().getPrice();
		}
		
		 return total;
	}
	
}