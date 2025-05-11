<%-- 
    Document   : manager-dashboard
    Created on : May 10, 2025, 5:07:33 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null ||
        !"manager".equals(((all.goods.entities.User) session.getAttribute("user")).getUserRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager Dashboard - AllGoods</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container py-4">
        <h2 class="mb-4">Manager Dashboard</h2>

        <div class="row">
            <!-- View Low Stock Products -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Low Stock Products</h5>
                        <p class="card-text">See products that are running low and need restocking.</p>
                        <a href="LowStockServlet" class="btn btn-primary">View Low Stock</a>
                    </div>
                </div>
            </div>

            <!-- View All Orders -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">View Orders</h5>
                        <p class="card-text">Check all customer orders made on the platform.</p>
                        <a href="ViewOrdersServlet" class="btn btn-primary">View Orders</a>
                    </div>
                </div>
            </div>

            <!-- Add Product -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Add New Product</h5>
                        <p class="card-text">Upload new product details to the store.</p>
                        <a href="add-product.jsp" class="btn btn-success">Add Product</a>
                    </div>
                </div>
            </div>

            <!-- Remove Product -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Remove Product</h5>
                        <p class="card-text">Delete existing products from the catalog.</p>
                        <a href="RemoveProductServlet" class="btn btn-danger">Remove Product</a>
                    </div>
                </div>
            </div>
        </div>

        <hr>
        <a href="logout.jsp" class="btn btn-outline-danger">Logout</a>
    </div>
</body>
</html>
