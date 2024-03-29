package ptithcm.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;

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

import ptithcm.entity.*;

@Controller
@RequestMapping("/staff/")
public class orderController {
	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping("Order")
	public String order(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from TheOrder";
		Query query = session.createQuery(hql);
		List<TheOrder> list = query.list();
		model.addAttribute("Order", list);
		model.addAttribute("ADMIN", loginController.checkMenu());
		return "Order/index";
	}
	@RequestMapping(value="SearchPhoneCustomerOrder", method=RequestMethod.POST)
	public String SearchPhoneCustomer(ModelMap mm,HttpServletRequest request) {
		String phone = request.getParameter("phone"); 
		Session session = factory.openSession();
		String hql = "from TheOrder A where A.customer.phone LIKE '%"+phone+"%'";
		Query query = session.createQuery(hql);
		List<TheOrder> list = query.list();
		mm.addAttribute("Order", list);
		return "Order/index";
	}
	@Transactional
	@RequestMapping("detailsOrder-{Id1}")
	public String orderDetails(ModelMap model, @PathVariable("Id1") String Id1) {
		Session session = factory.getCurrentSession();
		String hql="from OrderDetails A where A.orderId='"+Id1+"'";
//				+ " A where A.orderId="+"'"+Id1+"'";
//				+ "A where A.orderId="+"'"+Id1+"'";
		Query query = session.createQuery(hql);
		List<OrderDetails> list = query.list();
		model.addAttribute("OrderDetails", list);
		return "Order/details";
	}
	@RequestMapping("closeOrder-{Id1}")
	public String closeOrder(ModelMap model, @PathVariable("Id1") String Id1) {
		Float tong=(float) 0;
		Receipt receipt= new Receipt();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		String hql = "from TheOrder B where B.orderId= '"+ Id1 + "'";
		Query query = session.createQuery(hql);
		List<TheOrder> list = query.list();
		if(list.get(0).getStatus()==false)
		{
			model.addAttribute("message", "Ã„ï¿½Ã†Â¡n HÃƒÂ ng Ã„â€˜ÃƒÂ£ bÃ¡Â»â€¹ HÃ¡Â»Â§y");
			return "Order/index";
		}
		
		String hql1 ="from Staff A where A.username='"+loginController.account.getUsername()+"'";
		Query query1 = session.createQuery(hql1);
		List<Staff> listStaff= query1.list();
		
		String hql2 = "from OrderDetails A where A.orderId= '"+Id1+"'";
		Query query2 = session.createQuery(hql2);
		List<OrderDetails> listOrder = query2.list();
		for(OrderDetails A : listOrder)
		{
			tong+= A.getProduct().getPrice()*A.getQuantity();	
		}
		receipt.setStaff(listStaff.get(0));
		receipt.setCustomerId(list.get(0).getCustomer().getCustomerId());
		receipt.setDate(new Date());
		receipt.setAddress(list.get(0).getAddress());
		receipt.setTotal(tong);
		receipt.setReceiptId(this.createReceiptId());
		
		List<ReceiptDetails> listReceipDetails=new ArrayList<>();
		ReceiptDetails receiptDetails=new ReceiptDetails();
		int i=0;
		for(OrderDetails B : listOrder){
			receiptDetails =this.createReceiptDetails(i,B, receipt);
			receiptDetails.getProduct().setQuantity(receiptDetails.getProduct().getQuantity()-receiptDetails.getQuantity());
			this.updateProduct(receiptDetails.getProduct());
			listReceipDetails.add(i,receiptDetails);
			i++;
		}
		receipt.setReceiptDetails(listReceipDetails);
		this.insertReceipt(receipt);
		
		for(OrderDetails C : listOrder) {
			this.deleteOrderDetails(C);
		}
		
		this.deleteTheOrder(list.get(0));
		return "redirect:Order.htm";//tráº£ vá»� Ä‘á»ƒ load láº¡i danh sÃ¡ch
	}
	
	@RequestMapping("orderCancel-{Id}")
	public String orderCancel(ModelMap model, @PathVariable("Id") String Id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "from TheOrder B where B.orderId= '"+ Id + "'";
		Query query = session.createQuery(hql);
		List<TheOrder> list = query.list();
		list.get(0).setStatus(false);
		this.updateTheOrder(list.get(0));
		return "Order/index";
	}
	
	public void updateProduct(Product product)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(product);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void insertReceipt(Receipt receipt)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(receipt);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	public void insertReceiptDetails(ReceiptDetails receiptDetails)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(receiptDetails);
			t.commit();
		}catch(Exception e){
			t.rollback();
		}
		finally {
			session.close();
		}
	}
	public void deleteTheOrder(TheOrder theOrder) {
		Session session = factory.openSession();
		Transaction tt = session.beginTransaction();
		
		try {
			session.delete(theOrder);
			tt.commit();
		}
		catch (Exception e) {
			tt.rollback();
		}
		finally {
			session.close();
		}
	}
	public void deleteOrderDetails(OrderDetails orderDetails) {
		Session session = factory.openSession();
		Transaction tt = session.beginTransaction();
		
		try {
			session.delete(orderDetails);
			tt.commit();
		}
		catch (Exception e) {
			tt.rollback();
		}
		finally {
			session.close();
		}
	}
	public ReceiptDetails createReceiptDetails(int i,OrderDetails orderDetails,Receipt receipt) {

		ReceiptDetails receiptDetails = new ReceiptDetails();
		
		receiptDetails.setProduct(orderDetails.getProduct());;
		receiptDetails.setQuantity(orderDetails.getQuantity());
		receiptDetails.setReceipt(receipt);
		receiptDetails.setReceiptDetailsId(this.createReceiptDetailsId()+i);
		return receiptDetails;
		
	}
	public Integer getLastReceiptId()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(receiptId AS int)) from Receipt";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer id=list.get(0);
		return id;
	}
	public String createReceiptId()
	{
		Integer id=getLastReceiptId();
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
	public void updateTheOrder(TheOrder theOrder)
	{
		Session session = factory.openSession();
		Transaction tt = session.beginTransaction();
		
		try {
			session.update(theOrder);;
			tt.commit();
		}
		catch (Exception e) {
			tt.rollback();
		}
		finally {
			session.close();
		}
	}
	public Integer getLastReceiptDetailsId()
	{
		Session session = factory.openSession();
		String hql = "select max( CAST(receiptDetailsId AS int)) from ReceiptDetails";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		Integer id=list.get(0);
		return id;
	}
	public String createReceiptDetailsId()
	{
		Integer id=getLastReceiptDetailsId();
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
	
	
}