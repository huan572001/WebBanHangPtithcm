package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Account;
import ptithcm.entity.Customer;
import ptithcm.entity.Product;
@Controller
public class ShopProductController{
  
   
	@Autowired
	SessionFactory factory;
	
	@Transactional
	@RequestMapping(value = "shop", method = RequestMethod.GET)
	public String showView(ModelMap modelMap,HttpServletRequest request ) {
		
		Session session = factory.getCurrentSession();
		String hql = "from Product p where p.status='true'";
		Query query = session.createQuery(hql);
		String search =request.getParameter("search");
		
		List<Product> listProducts = query.list();
		
		modelMap.addAttribute("listProducts", listProducts);
		return"shop/products";
	}
	@Transactional
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String showViewSearch(ModelMap modelMap,HttpServletRequest request ) {
		String search =request.getParameter("search_box");
		Session session = factory.getCurrentSession();
		String hql = "from Product p where p.status='true'and p.name like '%"+search.toString()+"%'";
		Query query = session.createQuery(hql);
		List<Product> listProducts = query.list();
		modelMap.addAttribute("listProducts", listProducts);
		return"shop/search_page";
	}
	@Transactional
	@RequestMapping(value="quick_view/{id}",method = RequestMethod.GET)
	public String details(@PathVariable("id") String id , ModelMap modelMap,HttpSession session) {
		Session sessionhibernate = factory.getCurrentSession();
		String hql = "from Product A where A.productId=" + "'" + id + "'";
		Query query = sessionhibernate.createQuery(hql);
		Product product = (Product) query.list().get(0);
		modelMap.addAttribute("product", product);
		return "shop/quick_view";
	}
	

	
}