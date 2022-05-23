package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping(value = "shopProducts", method = RequestMethod.GET)
	public String showView(ModelMap modelMap,HttpServletRequest request ) {
		
		Session session = factory.getCurrentSession();
		String hql = "from Product p where p.status='true'";
		Query query = session.createQuery(hql);
		String search =request.getParameter("search");
		
		List<Product> listProducts = query.list();
		if(search!=null) {
			Session sessionSearch = factory.openSession();
			
			 hql = "from Product p where p.name like '%"+search.toString()+"%'";
			 query = sessionSearch.createQuery(hql);
			 listProducts = query.list();
		}
		modelMap.addAttribute("listProducts", listProducts);
		return"shop/products";
	}
	@RequestMapping(value="details/{id}", method=RequestMethod.GET)
	public String details(@PathVariable("id") String id , ModelMap modelMap) {
		
		return "shop/productsDetails";
	}
	

	
}