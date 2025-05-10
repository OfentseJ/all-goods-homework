/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.Product;
import all.goods.model.ProductFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LowStockServlet extends HttpServlet {

    @EJB
    private ProductFacadeLocal pfl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch products with quantity < 5
        List<Product> lowStockProducts = pfl.findLowStock(5); // You’ll define this method

        request.setAttribute("lowStockProducts", lowStockProducts);
        request.getRequestDispatcher("low-stock.jsp").forward(request, response);
    }
}