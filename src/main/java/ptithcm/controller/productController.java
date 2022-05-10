package ptithcm.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import ptithcm.entity.*;


import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Product;
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
		model.addAttribute("ADMIN", loginController.checkMenu());
		model.addAttribute("products", list);
		return "Product/index";
		
	}
	@RequestMapping(value="insertProduct", method=RequestMethod.GET)
	public String insertProduct(ModelMap model) {
		model.addAttribute("product", new Product());
		return "Product/insert";
	}
	@RequestMapping(value="insertProduct", method=RequestMethod.POST)
	public String insertProduct(ModelMap model, 
			@ModelAttribute("product") Product product,
			@RequestParam("photo") File photo) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		product.setProductId(this.createProductId());
		product.setImage((photo.getAbsolutePath().substring(photo.getAbsolutePath().lastIndexOf(photo.separator)+1)));
		System.out.print(photo.getAbsolutePath().substring(photo.getAbsolutePath().lastIndexOf(photo.separator)+1));
		if(product.getQuantity()<0) {
			model.addAttribute("message","So luong phai lon hon 0");
			return "Product/insert";
		}
		if(product.getCost()<0) {
			model.addAttribute("message","Gia Goc phai lon hon 0");
			return "Product/insert";
		}
		if(product.getPrice()<0) {
			model.addAttribute("message","Gia Ban phai lon hon 0");
			return "Product/insert";
		}
			
		product.setStatus(true);
	
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
	public String update(ModelMap model,@PathVariable("productId") String productId) {
		model.addAttribute("product", this.getCurrentProduct(productId));
		return "Product/update";
	}

	@RequestMapping(value="{productId}.htm", method=RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("product") Product product,@PathVariable("productId") String productId) {
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
	
	@RequestMapping(value="plus-{productId}.htm", method=RequestMethod.GET)
	public String  plusQuantity(ModelMap model,@PathVariable("productId") String productId) {
		model.addAttribute("product", this.getCurrentProduct(productId));
		return "Product/plusQuantity";
	}

	@RequestMapping(value="plus-{productId}.htm", method=RequestMethod.POST)
	public String plusQuantity(ModelMap model, @ModelAttribute("product") Product product,@PathVariable("productId") String productId) {
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
		return "Product/plusQuantity";
	}
	@RequestMapping(value="SearchNameProduct", method=RequestMethod.POST)
	public String SearchNameProduct(ModelMap mm,HttpServletRequest request) {
		String name = request.getParameter("name"); 
		System.out.print(name);
		Session session = factory.openSession();
		String hql = "from Product a where a.name='"+name+"'";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		mm.addAttribute("products", list);
		return "Product/index";
	}
	public Integer getLastProductId()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(productId AS int)) from Product";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer id=list.get(0);
		return id;
	}
	public String createProductId()
	{
		Integer id=getLastProductId();
		if(id==null)
		{
			id=1;
		}
		else
		{
			id+=1;
		}
		return id.toString();
	}
	public Product getCurrentProduct(String productId)
	{
		Session session = factory.openSession();
		String hql = "From Product A where A.productId= '"+productId+"'";
		Query query = session.createQuery(hql);
		List<Product> list =query.list();
		Product product =list.get(0);
		return product;
		
	}
}
