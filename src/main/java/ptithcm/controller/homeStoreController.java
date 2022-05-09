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
	@RequestMapping(value = "homeStore", method = RequestMethod.GET)
	public String showForm(HttpSession httpsession) {
		
		 Customer customer =(Customer)httpsession.getAttribute("currentUser");   
		if(customer==null)
		return"redirect:login.htm";
		
		return "shop/home";
	}

	@RequestMapping(value = "shopping", method = RequestMethod.POST)
	public  String shoppingNow(HttpServletRequest request, ModelMap model, HttpSession httpsession) {
		
		try{
			 Customer customer =(Customer)httpsession.getAttribute("currentUser"); 
	    		String fullname = customer.getFullname();    
		        model.addAttribute("username", fullname);
		}
		catch (Exception e) {
			return"redirect:login.htm";
		}
		
			return "redirect:Products.htm";
		
	}
	@RequestMapping(value = "about", method = RequestMethod.GET)
	public  String about() {
		
			return "shop/about";
		
	}
}