/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.Order;
import all.goods.model.OrderFacadeLocal;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class ViewOrdersServlet extends HttpServlet {

    @EJB
    private OrderFacadeLocal orderFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = orderFacade.findAll();

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("view-orders.jsp").forward(request, response);
    }
}