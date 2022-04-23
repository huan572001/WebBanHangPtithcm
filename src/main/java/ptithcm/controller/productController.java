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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ptithcm.entity.*;


import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class productController {
	@Autowired
	SessionFactory factory;
	@Transactional
	@RequestMapping("Product")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from Product";
		Query query = session.createQuery(hql);

		List<Product> list = query.list();       
		model.addAttribute("products", list);
		return "Product/index";
		
	}
	@RequestMapping(value="insertProduct", method=RequestMethod.GET)
	public String insertProduct(ModelMap model) {
		model.addAttribute("product", new Product());
		return "Product/insert";
	}
	@RequestMapping(value="insertProduct", method=RequestMethod.POST)
	public String insertProduct(ModelMap model, @ModelAttribute("product") Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(product);
			t.commit();
			model.addAttribute("message", "Create Successful Product");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Product Creation Failed");
		}
		finally {
			session.close();
		}
		return "Product/insert";
	}
	@RequestMapping("delete-{productId}.htm")
	public String delete(ModelMap model, @ModelAttribute("product") Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
			t.commit();
			model.addAttribute("message", "Delete Success!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete Failed !");
		}
		finally {
			session.close();
		}
		return "Product/index";
	}

	@RequestMapping(value="{productId}.htm", method=RequestMethod.GET)
	public String update(ModelMap model) {
		model.addAttribute("product", new Product());
		return "Product/update";
	}

	@RequestMapping(value="{productId}.htm", method=RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("product") Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(product);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại!");
		}
		finally {
			session.close();
		}
		return "Product/update";
	}
	@RequestMapping(value="SearchNameProduct", method=RequestMethod.POST)
	public String SearchNameProduct(ModelMap mm,HttpServletRequest request) {
		String name = request.getParameter("name"); 
		System.out.print(name);
		Session session = factory.openSession();
		String hql = "from Product a where a.name='"+name+"'";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		System.out.print(list.get(0).getName());
		mm.addAttribute("products", list);
		return "Product/index";
	}
}
