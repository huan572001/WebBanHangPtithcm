package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ReceiptDetails")
public class ReceiptDetails {
	@Id
	private String receiptDetailsId;
	@ManyToOne
    @JoinColumn(name = "receiptId")
	private Receipt receipt;
	private Integer quantity;
	@ManyToOne
	@JoinColumn(name="productId")
	private Product product;
	
	
	public Receipt getReceipt() {
		return receipt;
	}
	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	public String getReceiptDetailsId() {
		return receiptDetailsId;
	}
	public void setReceiptDetailsId(String receiptDetailsId) {
		this.receiptDetailsId = receiptDetailsId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
