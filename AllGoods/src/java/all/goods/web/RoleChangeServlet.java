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
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class RoleChangeServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the userId and new role from the request
        Long userId = Long.parseLong(request.getParameter("userId"));
        String newRole = request.getParameter("newRole");

        // Find the user by their ID
        User user = userFacade.find(userId);

        // Check if the user exists
        if (user != null) {
            // Change the user's role
            user.setUserRole(newRole);
            // Update the user in the database
            userFacade.edit(user);

            // Redirect to the admin panel with a success message
            request.setAttribute("successMessage", "User role updated successfully.");
        } else {
            // If user is not found, set an error message
            request.setAttribute("errorMessage", "User not found.");
        }

        // Forward back to the admin panel to reflect the changes
        request.getRequestDispatcher("admin-panel.jsp").forward(request, response);
    }
}