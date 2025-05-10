/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all.goods.web;

import all.goods.entities.User;
import all.goods.model.UserFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class AdminServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFacade;

    // Hardcoded admin credentials (for demo)
    private static final String ADMIN_EMAIL = "admin@allgoods.com";
    private static final String ADMIN_PASSWORD = "admin123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Boolean loggedIn = (Boolean) session.getAttribute("isAdmin");

        if (loggedIn != null && loggedIn) {
            // If admin is already logged in, show admin panel
            List<User> users = userFacade.findAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("admin-panel.jsp").forward(request, response);
        } else {
            // Show login page
            request.getRequestDispatcher("admin-login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("isAdmin", true);
            response.sendRedirect("AdminServlet");
        } else {
            // Failed login
            request.setAttribute("error", "Invalid credentials.");
            request.getRequestDispatcher("admin-login.jsp").forward(request, response);
        }
    }
}