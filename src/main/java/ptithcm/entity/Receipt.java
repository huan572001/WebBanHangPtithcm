package ptithcm.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ManyToAny;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Receipt")
public class Receipt {
	@Id
	private String receiptId;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date date;
	private	String customerId;
	private String staffId;
	private Float total;
	
	public Float getTotal() {
		return total;
	}
	public void setTotal(Float total) {
		this.total = total;
	}
	public String getReceiptId() { 
		return receiptId;
	}
	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	
	
	
}
