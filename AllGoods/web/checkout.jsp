<%-- 
    Document   : checkout.jsp
    Created on : May 10, 2025, 6:54:18 PM
    Author     : user
--%>

<%@ page import="java.util.*, all.goods.entities.Product, all.goods.model.CartItem" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <h2 class="mb-4">Checkout</h2>

    <%
        Map<Long, CartItem> cart = (Map<Long, CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="alert alert-info">Your cart is empty.</div>
    <%
        } else {
            double total = 0;
    %>

    <!-- Cart Summary Table -->
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (CartItem item : cart.values()) { // Iterate through the map values (CartItem objects)
                Product p = item.getProduct();
                double subtotal = p.getPrice() * item.getQuantity();
                total += subtotal;
        %>
            <tr>
                <td><%= p.getName() %></td>
                <td>$<%= String.format("%.2f", p.getPrice()) %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= String.format("%.2f", subtotal) %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Total -->
    <div class="text-end mb-4">
        <h5>Total: R<%= String.format("%.2f", total) %></h5>
    </div>

    <!-- Shipping Form -->
    <form action="CheckoutServlet" method="post" class="row g-3">
        <h4>Shipping Details</h4>
        <div class="col-md-6">
            <label for="fullName" class="form-label">Full Name</label>
            <input type="text" class="form-control" name="fullName" required>
        </div>
        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" required>
        </div>
        <div class="col-md-12">
            <label for="address" class="form-label">Shipping Address</label>
            <textarea class="form-control" name="address" rows="3" required></textarea>
        </div>
        <div class="col-12 text-end">
            <button type="submit" class="btn btn-primary">Place Order</button>
        </div>
    </form>

    <%
        }
    %>
</div>

</body>
</html>
