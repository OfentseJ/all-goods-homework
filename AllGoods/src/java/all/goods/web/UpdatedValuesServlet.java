/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package all.goods.web;

import all.goods.entities.Product;
import all.goods.model.ProductFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alexd
 */
public class UpdatedValuesServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long productId = Long.parseLong(request.getParameter("productId"));
            String newName = request.getParameter("newName");
            String newDescription = request.getParameter("newDescription");
            String newPriceStr = request.getParameter("newPrice");
            String newQuantityStr = request.getParameter("newQuantity");

            Product product = pfl.find(productId);
            if (product != null) {
                if (newName != null && !newName.trim().isEmpty()) {                                                                                           
                    product.setName(newName.trim());
                }
                if (newDescription != null && !newDescription.trim().isEmpty()) {
                    product.setDescription(newDescription.trim());
                }
                if (newPriceStr != null && !newPriceStr.trim().isEmpty()) {
                    try {
                        double newPrice = Double.parseDouble(newPriceStr);
                        product.setPrice(newPrice);
                    } catch (NumberFormatException e) {
                        // log or ignore invalid price
                    }
                }
                if (newQuantityStr != null && !newQuantityStr.trim().isEmpty()) {
                    try {
                        int newQuantity = Integer.parseInt(newQuantityStr);
                        product.setQuantity(newQuantity);
                    } catch (NumberFormatException e) {
                        // log or ignore invalid quantity
                    }
                }
                pfl.edit(product);
            }

            response.sendRedirect("EditStockServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manager-dashboard.jsp?error=Update+failed");
        }
    }
}
