/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package all.goods.web;

import all.goods.entities.Product;
import all.goods.model.ProductFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal pfl;


    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.getWriter().write("Servlet is working.");
        }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get product ID
            int productId = Integer.parseInt(request.getParameter("productId"));

            // Find the product by ID
            Product product = pfl.find(productId);
            if (product == null) {
                response.sendRedirect("edit_stock.jsp?error=ProductNotFound");
                return;
            }

            // Update fields only if provided
            String newName = request.getParameter("newName");
            if (newName != null && !newName.trim().isEmpty()) {
                product.setName(newName.trim());
            }

            String newDescription = request.getParameter("newDescription");
            if (newDescription != null && !newDescription.trim().isEmpty()) {
                product.setDescription(newDescription.trim());
            }

            String newPriceStr = request.getParameter("newPrice");
            if (newPriceStr != null && !newPriceStr.trim().isEmpty()) {
                try {
                    double newPrice = Double.parseDouble(newPriceStr);
                    product.setPrice(newPrice);
                } catch (NumberFormatException e) {
                    // Optional: log or handle invalid number
                }
            }

            String newQuantityStr = request.getParameter("newQuantity");
            if (newQuantityStr != null && !newQuantityStr.trim().isEmpty()) {
                try {
                    int newQuantity = Integer.parseInt(newQuantityStr);
                    product.setQuantity(newQuantity);
                } catch (NumberFormatException e) {
                    // Optional: log or handle invalid number
                }
            }

            // Persist updates
            pfl.edit(product);

        } catch (Exception ex) {
            ex.printStackTrace(); // Optional: log properly in real application
        }

        // Redirect to EditStockServlet to refresh the product list
        response.sendRedirect("EditStockServlet");
    }
}
