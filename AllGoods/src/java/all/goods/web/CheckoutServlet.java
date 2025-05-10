/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.Order;
import all.goods.entities.OrderItem;
import all.goods.entities.Product;
import all.goods.entities.User;
import all.goods.model.CartItem;
import all.goods.model.OrderFacadeLocal;
import all.goods.model.ProductFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class CheckoutServlet extends HttpServlet {

    @EJB
    private OrderFacadeLocal orderFacade;

    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve cart and user
        HttpSession session = request.getSession();
        Map<Long, CartItem> cart = (Map<Long, CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        if (cart == null || cart.isEmpty() || user == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Create a new Order
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDateTime.now());

        List<OrderItem> orderItems = new ArrayList<>();

        // Process each CartItem in the cart (which is now a Map)
        for (CartItem item : cart.values()) {  // cart.values() returns a Collection<CartItem>
            Product product = productFacade.find(item.getProduct().getId());

            if (product != null && product.getQuantity() >= item.getQuantity()) {
                // Decrease product stock
                product.setQuantity(product.getQuantity() - item.getQuantity());
                productFacade.edit(product);

                // Create OrderItem
                OrderItem orderItem = new OrderItem();
                orderItem.setOrder(order);
                orderItem.setProduct(product);
                orderItem.setQuantity(item.getQuantity());
                orderItem.setPrice(product.getPrice());

                orderItems.add(orderItem);
            }
        }

        // Set the order items to the order and save the order
        order.setItems(orderItems);
        orderFacade.create(order);

        // Clear the cart
        session.removeAttribute("cart");

        // Redirect to confirmation page
        response.sendRedirect("order-confirmation.jsp");
    }
}