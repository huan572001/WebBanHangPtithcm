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
	@Id @GeneratedValue
	private Integer receiptDetailsId;
	private String receiptId;
	private Integer quantity;
	@ManyToOne
	@JoinColumn(name="productId")
	private Product product;
	public Integer getReceiptDetailsId() {
		return receiptDetailsId;
	}
	public void setReceiptDetailsId(Integer receiptDetailsId) {
		this.receiptDetailsId = receiptDetailsId;
	}
	public String getReceiptId() {
		return receiptId;
	}
	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
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
