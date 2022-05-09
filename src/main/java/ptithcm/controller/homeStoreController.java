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

import ptithcm.entity.*;
@Controller
public class homeStoreController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "homeStore", method = RequestMethod.GET)
	public String showForm(HttpSession httpsession,ModelMap model) {
		
		 Customer customer =(Customer)httpsession.getAttribute("currentUser");   
		if(customer==null)
		return"redirect:login.htm";
		//model.addAttribute("lastProduct", getLastProduct()) ;
		return "shop/home";
	}

	@RequestMapping(value = "shopping", method = RequestMethod.GET)
	public  String shoppingNow(HttpServletRequest request,ModelMap modelMap, HttpSession httpsession) {
		
		Session session = factory.openSession();
		String search =getLastProduct().getName();
		String hql = "from Product p where p.name like '%"+search.toString()+"%'";
		Query query = session.createQuery(hql);
		List<Product> listProducts = query.list();
		modelMap.addAttribute("listProducts", listProducts);
		return"shop/products";
		
	}

	public Product getLastProduct()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(productId AS int)) from Product";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer id=list.get(0);
		 session = factory.openSession();
		 hql = "from Product p where p.productId='"+id+"'";
		 List<Product> listP = query.list();
		return listP.get(0);
	}
	@RequestMapping(value = "about", method = RequestMethod.GET)
	public  String about() {
		
			return "shop/about";
		
	}
}