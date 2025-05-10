<%-- 
    Document   : home
    Created on : May 10, 2025, 3:24:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="all.goods.entities.User"%>
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("user") : null;

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home - AllGoods</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .welcome-box {
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <div class="container welcome-box text-center">
        <div class="card shadow p-5">
            <h2>Welcome to AllGoods, <%= user.getName() %>!</h2>
            <p class="lead mt-3">Browse our wide variety of products and shop with ease.</p>
            <a href="ViewProductsServlet" class="btn btn-success mt-3">View Products</a>
            <a href="logout.jsp" class="btn btn-outline-secondary mt-3 ms-2">Logout</a>
        </div>
    </div>
</body>
</html>
