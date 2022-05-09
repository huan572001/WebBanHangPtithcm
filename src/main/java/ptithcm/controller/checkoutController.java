package ptithcm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Cart;
import ptithcm.entity.*;


@Controller
public class checkoutController {
	@Autowired
	SessionFactory factory;

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String showForm() {
		return "shop/checkout";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String viewCheckout(ModelMap mm, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("currentUser");
		if (customer == null) {
			return "redirect:login.htm";
		}
		mm.addAttribute("nameCustomer", customer.getFullname());
		mm.addAttribute("phoneCustomer", customer.getPhone());
		return "shop/checkout";
	}

	@RequestMapping(value = "purchase", method = RequestMethod.POST)
	public String purcharse(ModelMap mm, HttpSession session, HttpServletRequest request) {
		TheOrder oder = new TheOrder();
		Session hibenateSession = factory.openSession();
		Transaction t = hibenateSession.beginTransaction();
		HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			return "redirect:shopProducts.htm";
		}
		Customer customer = (Customer) session.getAttribute("currentUser");
		oder.setOrderId(this.createOrderId());
		oder.setAddress(request.getParameter("houseadd"));
		oder.setCustomer(customer);
		oder.setStatus(true);//
		// email

		try {
			hibenateSession.save(oder);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return "redirect:/checkout.htm";

		}
		for (Map.Entry<String, Cart> entry : cartItems.entrySet()) {
			OrderDetails item = new OrderDetails();
			item.setOrderDetailsId(this.createOrderDetailsId());
			item.setOrderId(oder.getOrderId());
			item.setProduct(this.getProductById(entry.getKey()));
			item.setQuantity(entry.getValue().getQuantity());
			this.insertItem(item);
//		  			hibenateSession.save(item);
		}
<<<<<<< HEAD
		this.cleanUpAfterCheckout(session);
=======
		cleanUpAfterCheckout(session);
>>>>>>> 98ee1001f13affa30b43350231ef2a4bfe989d92
		return "shop/purchase";

	}

	public void cleanUpAfterCheckout(HttpSession session) {
		 session.setAttribute("myCartItems", null);
	        session.setAttribute("myCartTotal", null);
	        session.setAttribute("myCartNum", null);
		
	}
	public void insertItem(OrderDetails orderDetails) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
		session.save(orderDetails);
		t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	public Integer getLastOrderId()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(orderId AS int)) from TheOrder";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		if(list.isEmpty()) return 0;
		Integer id=list.get(0);
		return id;
	}
	public String createOrderId()
	{
		Integer id=getLastOrderId();
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
	public Integer getLastOrderDetailsId()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(orderDetailsId AS int)) from OrderDetails";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		if(list.isEmpty()) return 0;
		Integer id=list.get(0);
		return id;
	}
	public String createOrderDetailsId()
	{
		Integer id=getLastOrderDetailsId();
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
	public Product getProductById(String productId)
	{
		Session session = factory.openSession();
		String hql = "from Product p where p.productId='"+productId+"'";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		if(list.isEmpty()) return null;
		Product product=list.get(0);
		return product;
	}
}