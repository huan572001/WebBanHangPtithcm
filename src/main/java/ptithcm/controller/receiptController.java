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

import ptithcm.entity.TurnoverStaff;
import ptithcm.entity.ReceiptDetails;
import ptithcm.entity.Staff;
import ptithcm.entity.Product;
import ptithcm.entity.Receipt;
@Controller
public class receiptController {
	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping("Receipt")
	public String receipt(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from Receipt";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		model.addAttribute("Receipt", list);
		model.addAttribute("ADMIN", loginController.checkMenu());
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
	@RequestMapping("Turnover")
	public String turnover(ModelMap model) {
		Session session = factory.openSession();
		String hql = "from Receipt";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		Float turnover=(float) 0;
		Float profit=(float) 0;
		Float turnoverStaff=(float) 0;
		Float profitStaff=(float) 0;
		for(Receipt receipt : list)
		{
			String hql1="from ReceiptDetails A where A.receiptId="+"'"+receipt.getReceiptId()+"'" ;
			Query query1 = session.createQuery(hql1);
			List<ReceiptDetails> listReceiptDetails = query1.list();
			for(ReceiptDetails receiptDetails : listReceiptDetails)
			{
				profit+=(float) ((receiptDetails.getProduct().getPrice() - receiptDetails.getProduct().getCost())*receiptDetails.getQuantity());
				turnover+=(float) (receiptDetails.getProduct().getPrice()*receiptDetails.getQuantity());
			}
		}
		model.addAttribute("turnover", turnover);
		model.addAttribute("profit", profit);
		String hql1 = "from Staff";
		Query query1 = session.createQuery(hql1);
		List<Staff> listStaff = query1.list();
		List<TurnoverStaff> listTurnoverStaff = new ArrayList<>() ;
		
		
		
		Integer i = 0;
		
		for(Staff staff : listStaff)
		{
			TurnoverStaff turnoverStafftmp= new TurnoverStaff();
			String hql2="from Receipt A where A.staffId='"+staff.getStaffId()+"'" ;
			Query query2 = session.createQuery(hql2);
			List<Receipt> listReceipt = query2.list();
			for(Receipt receipt : listReceipt)
			{
				String hql3="from ReceiptDetails A where A.receiptId="+"'"+receipt.getReceiptId()+"'" ;
				Query query3 = session.createQuery(hql3);
				List<ReceiptDetails> listReceiptDetails = query3.list();
				for(ReceiptDetails receiptDetails : listReceiptDetails)
				{
					profitStaff+=(float) ((receiptDetails.getProduct().getPrice() - receiptDetails.getProduct().getCost())*receiptDetails.getQuantity());
					turnoverStaff+=(float) (receiptDetails.getProduct().getPrice()*receiptDetails.getQuantity());
				} 
			}
			System.out.print(staff.getStaffId());
			
			turnoverStafftmp.setStaffId(staff.getStaffId());
			turnoverStafftmp.setStaffName(staff.getFullname());
			turnoverStafftmp.setProfit(profitStaff);
			turnoverStafftmp.setTurnover(turnoverStaff);
			turnoverStaff=(float) 0;
			profitStaff=(float) 0;
			
			
			listTurnoverStaff.add(i,turnoverStafftmp);
			System.out.print(listTurnoverStaff.get(i).getStaffId());
			
			i+=1;
		}
		model.addAttribute("staffTurnover", listTurnoverStaff);
		return "Receipt/turnover";
	}
	@RequestMapping(value="turnoverSearchDate", method=RequestMethod.POST)
	public String turnoverSearchDate(ModelMap model,HttpServletRequest request) {
		String sinceDay = request.getParameter("sinceDay"); 
		String toTheDay = request.getParameter("toTheDay");
		Session session = factory.openSession();
		String hql = "from Receipt a where a.date>'"+sinceDay+"' and a.date<'"+toTheDay+"'";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		Float turnover=(float) 0;
		Float profit=(float) 0;
		Float turnoverStaff=(float) 0;
		Float profitStaff=(float) 0;
		for(Receipt receipt : list)
		{
			String hql1="from ReceiptDetails A where A.receiptId="+"'"+receipt.getReceiptId()+"'" ;
			Query query1 = session.createQuery(hql1);
			List<ReceiptDetails> listReceiptDetails = query1.list();
			for(ReceiptDetails receiptDetails : listReceiptDetails)
			{
				profit+=(float) ((receiptDetails.getProduct().getPrice() - receiptDetails.getProduct().getCost())*receiptDetails.getQuantity());
				turnover+=(float) (receiptDetails.getProduct().getPrice()*receiptDetails.getQuantity());
			}
		}
		model.addAttribute("turnover", turnover);
		model.addAttribute("profit", profit);
		String hql1 = "from Staff";
		Query query1 = session.createQuery(hql1);
		List<Staff> listStaff = query1.list();
		List<TurnoverStaff> listTurnoverStaff = new ArrayList<>() ;
		
		
		
		Integer i = 0;
		
		for(Staff staff : listStaff)
		{
			TurnoverStaff turnoverStafftmp= new TurnoverStaff();
			String hql2="from Receipt a where a.date>'"+sinceDay+"' and a.date<'"+toTheDay+"'and a.staffId ='"+staff.getStaffId()+"'" ;
			Query query2 = session.createQuery(hql2);
			List<Receipt> listReceipt = query2.list();
			for(Receipt receipt : listReceipt)
			{
				String hql3="from ReceiptDetails A where A.receiptId="+"'"+receipt.getReceiptId()+"'" ;
				Query query3 = session.createQuery(hql3);
				List<ReceiptDetails> listReceiptDetails = query3.list();
				for(ReceiptDetails receiptDetails : listReceiptDetails)
				{
					profitStaff+=(float) ((receiptDetails.getProduct().getPrice() - receiptDetails.getProduct().getCost())*receiptDetails.getQuantity());
					turnoverStaff+=(float) (receiptDetails.getProduct().getPrice()*receiptDetails.getQuantity());
				} 
			}
			System.out.print(staff.getStaffId());
			
			turnoverStafftmp.setStaffId(staff.getStaffId());
			turnoverStafftmp.setStaffName(staff.getFullname());
			turnoverStafftmp.setProfit(profitStaff);
			turnoverStafftmp.setTurnover(turnoverStaff);
			turnoverStaff=(float) 0;
			profitStaff=(float) 0;
			
			
			listTurnoverStaff.add(i,turnoverStafftmp);
			System.out.print(listTurnoverStaff.get(i).getStaffId());
			
			i+=1;
		}
		model.addAttribute("staffTurnover", listTurnoverStaff);
		return "Receipt/turnover";
	}
}
