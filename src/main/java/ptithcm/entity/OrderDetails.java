package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderDetails")
public class OrderDetails {
	@Id @GeneratedValue
	private Integer orderDetailsId;
	private String orderId;
	private Integer quantity;
	
	public Integer getOrderDetailsId() {
		return orderDetailsId;
	}
	public void setOrderDetailsId(Integer orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}
	@ManyToOne
	@JoinColumn(name="productId")
	
	private Product product;
	

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
