/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.Product;
import all.goods.model.ProductFacadeLocal;
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
public class RemoveProductServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal productFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productIdStr = request.getParameter("productId");

        if (productIdStr != null) {
            try {
                Long productId = Long.parseLong(productIdStr);
                Product product = productFacade.find(productId);
                if (product != null) {
                    productFacade.remove(product);
                }
            } catch (NumberFormatException e) {
                // log error (optional)
            }
        }

        List<Product> products = productFacade.findAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("remove-product.jsp").forward(request, response);
        
    }
}