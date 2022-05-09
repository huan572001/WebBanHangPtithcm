package ptithcm.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.*;
import model.Cart;

/**
 *
 * @author TVD
 */
@Controller
public class CartController {
	@Autowired
	SessionFactory factory;
    
    private Product products;
  
    
    

	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String showView() {
		return "shop/cart";
	}
	@Transactional
    @RequestMapping(value = "add/{productId}")
    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("productId") String productId) {
        HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Session sessionhibernate = factory.getCurrentSession();
        String hql = "from Product A where A.productId="+"'"+productId+"'";
		Query query = sessionhibernate.createQuery(hql);
        Product product = (Product) query.list().get(0);
        if (product != null) {
            if (cartItems.containsKey(productId)) {
                Cart item = cartItems.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                cartItems.put(productId, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(1);
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/shopProducts.htm";
    }

    @RequestMapping(value = "sub/{productId}", method = RequestMethod.GET)
    public String viewUpdate(ModelMap mm, HttpSession session, @PathVariable("productId") String productId) {
        HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        session.setAttribute("myCartItems", cartItems);
        return "shop/cart";
    }

    @RequestMapping(value = "remove/{productId}", method = RequestMethod.GET)
    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("productId") String productId) {
        HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "shop/cart";
    }

    

    public double totalPrice(HashMap<String, Cart> cartItems) {
        int count = 0;
        for (Map.Entry<String, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }
    

}