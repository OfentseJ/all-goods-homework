<%-- 
    Document   : cart
    Created on : May 10, 2025, 6:25:42 PM
    Author     : user
--%>

<%@ page import="java.util.*, all.goods.entities.Product, all.goods.model.CartItem" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
<jsp:include page="header.jsp" />
<!-- Container for page content -->
<div class="container mt-4">
    <h2 class="text-center">Your Shopping Cart</h2>

    <%
        Map<Long, CartItem> cart = (Map<Long, CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <!-- Message when cart is empty -->
        <p class="text-center">Your cart is empty.</p>
        <div class="text-center">
            <a href="ViewProductsServlet" class="btn btn-success">Go Back</a>
        </div>
    <%
        } else {
            double total = 0;
    %>
        <!-- Table for cart items -->
        <form action="UpdateCartServlet" method="post">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Subtotal</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Map.Entry<Long, CartItem> entry : cart.entrySet()) {
                        CartItem item = entry.getValue();
                        Product p = item.getProduct();
                        double subtotal = p.getPrice() * item.getQuantity();
                        total += subtotal;
                %>
                    <!-- Display each cart item -->
                    <tr>
                        <td>
                            <img src="ImageServlet?id=<%= p.getId() %>" alt="<%= p.getName() %>" style="height: 60px; width: 60px; object-fit: cover; border-radius: 5px; margin-right: 10px;">
                            <%= p.getName() %>
                        </td>
                        <td>$<%= String.format("%.2f", p.getPrice()) %></td>
                        <td>
                            <!-- Quantity input -->
                            <input type="number" name="quantity_<%= p.getId() %>" value="<%= item.getQuantity() %>" min="1" class="form-control" style="width: 80px;">
                        </td>
                        <td>$<%= String.format("%.2f", subtotal) %></td>
                        <td>
                            <!-- Buttons to update or remove item -->
                            <button type="submit" name="update_<%= p.getId() %>" value="update" class="btn btn-warning btn-sm">Update</button>
                            <button type="submit" name="remove_<%= p.getId() %>" value="remove" class="btn btn-danger btn-sm">Remove</button>
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>

            <!-- Total price section -->
            <p class="text-end fs-4"><strong>Total:</strong> $<%= String.format("%.2f", total) %></p>

            <!-- Checkout button -->
            <div class="text-center">
                <a href="ViewProductsServlet" class="btn btn-success">Go Back</a>
                <a href="checkout.jsp" class="btn btn-primary">Proceed to Checkout</a>
            </div>
        </form>
    <%
        }
    %>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>
</html>
