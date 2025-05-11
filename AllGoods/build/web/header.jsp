<%-- 
    Document   : header
    Created on : May 11, 2025, 4:13:28 PM
    Author     : user
--%>

<%@page import="java.util.Map"%>
<%@ page session="true" %>
<%@ page import="all.goods.entities.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="ViewProductsServlet">AllGoods</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <%
                    User user = (User) session.getAttribute("user");
                    int cartCount = 0;
                    Map<Long, all.goods.model.CartItem> cart = (Map<Long, all.goods.model.CartItem>) session.getAttribute("cart");
                    if (cart != null) {
                        for (all.goods.model.CartItem item : cart.values()) {
                            cartCount += item.getQuantity();
                        }
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="ViewProductsServlet">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart (<%= cartCount %>)</a>
                </li>
                <% if (user != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
