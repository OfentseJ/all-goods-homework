/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.model.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class UpdateCartServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Long, CartItem> cart = (Map<Long, CartItem>) session.getAttribute("cart");
        
        if (cart != null) {
            // Iterate through the parameters to find updates or removals
            for (String param : request.getParameterMap().keySet()) {
                if (param.startsWith("quantity_")) {
                    Long productId = Long.parseLong(param.substring("quantity_".length()));
                    int newQuantity = Integer.parseInt(request.getParameter(param));
                    CartItem item = cart.get(productId);
                    if (item != null && newQuantity > 0) {
                        item.setQuantity(newQuantity);  // Update quantity
                    }
                } else if (param.startsWith("remove_")) {
                    Long productId = Long.parseLong(param.substring("remove_".length()));
                    cart.remove(productId);  // Remove item from cart
                }
            }
        }
        
        // Update the session with the modified cart
        session.setAttribute("cart", cart);

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
