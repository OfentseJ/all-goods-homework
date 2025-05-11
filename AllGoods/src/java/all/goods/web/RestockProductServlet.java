/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.Product;
import all.goods.model.ProductFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class RestockProductServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long productId = Long.parseLong(request.getParameter("productId"));
            int restockAmount = Integer.parseInt(request.getParameter("restockAmount"));

            Product product = pfl.find(productId);
            if (product != null) {
                product.setQuantity(product.getQuantity() + restockAmount);
                pfl.edit(product);
            }

            response.sendRedirect("LowStockServlet");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("manager-dashboard.jsp?error=Invalid+data");
        }
    }
}