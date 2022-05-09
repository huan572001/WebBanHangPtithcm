package ptithcm.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Account;
import ptithcm.entity.Customer;
import ptithcm.entity.Staff;

@Controller
public class forgotpasswordController {
	private String password;
	private String email;

	@Autowired
	JavaMailSender mailer;
	@Autowired
	SessionFactory factory;

	@RequestMapping(value = "checkAccount", method = RequestMethod.GET)
	public String checkAccount(ModelMap model) {
		return "mailer/form";
	}

	@Transactional
	@RequestMapping(value = "checkAccount", method = RequestMethod.POST)
	public String checkAccount(ModelMap model, @RequestParam("account") String account) {
		Session session = factory.getCurrentSession();
		String hql = "from Account a where a.username='" + account + "'";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		if (list.isEmpty()) {
			model.addAttribute("message", "Tai khoan khong ton tai");
			return "mailer/form";
		} else {
			try {
				if (list.get(0).getPosition() == "KH") {
					String hqlCustomer = "from Customer a where a.username='" + account + "'";
					Query queryCustomer = session.createQuery(hqlCustomer);
					List<Customer> listCustomer = queryCustomer.list();
					email = listCustomer.get(0).getEmail();
					System.out.print(email);
				} else {
					String hqlStaff = "from Staff a where a.username='" + account + "'";
					Query queryStaff = session.createQuery(hqlStaff);
					List<Staff> listStaff = queryStaff.list();
					email = listStaff.get(0).getEmail();
					System.out.print(email);
				}
				password = list.get(0).getPassword();
				String from = "huan572001@gmail.com";
				String subject = "Web ban linh kien thong bao Mat khau cho ban";
				String body = "Mat khau cau ban la: '" + password+"' hay dang nhap va doi lại mat khau cau ban";
				String to = email;
				try {
					System.out.print(email);
					MimeMessage mail = mailer.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mail);
					helper.setFrom(from, from);
					helper.setTo(to);
					helper.setReplyTo(from, from);
					helper.setSubject(subject);
					helper.setText(body, true);

					mailer.send(mail);
					model.addAttribute("message", "Password sent to your email");
				} catch (Exception e) {
					model.addAttribute("message", "Email sending failed");
				}
			} catch (Exception e) {
				model.addAttribute("message", "Email sending failed");
			}
		}
		return "mailer/form";
	}
}
