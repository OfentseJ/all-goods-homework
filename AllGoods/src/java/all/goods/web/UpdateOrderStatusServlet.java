/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.Order;
import all.goods.model.OrderFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class UpdateOrderStatusServlet extends HttpServlet {

    @EJB
    private OrderFacadeLocal ofl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long orderId = Long.parseLong(request.getParameter("orderId"));
        String status = request.getParameter("status");

        Order order = ofl.find(orderId);
        if (order != null) {
            order.setStatus(status);
            ofl.edit(order);
        }

        response.sendRedirect("ViewOrdersServlet");
    }
}