<%-- 
    Document   : view-orders
    Created on : May 10, 2025, 5:18:05 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="all.goods.entities.Order" %>
<%@ page import="all.goods.entities.OrderItem" %>
<%@ page import="all.goods.entities.Product" %>
<%@ page import="all.goods.entities.User" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Orders - Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">All Orders</h2>
    <a href="manager-dashboard.jsp" class="btn btn-secondary mb-3">← Back to Dashboard</a>
    <table class="table table-bordered table-hover bg-white">
        <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>Customer</th>
            <th>Items</th>
            <th>Order Date</th>
            <th>Total Price</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
                    User user = order.getUser();
                    double totalPrice = 0.0;
        %>
        <tr>
            <td><%= order.getId() %></td>
            <td><%= user != null ? user.getName() + " (" + user.getEmail() + ")" : "N/A" %></td>
            <td>
                <ul>
                <%
                    for (OrderItem item : order.getItems()) {
                        Product product = item.getProduct();
                        int qty = item.getQuantity();
                        double price = (product != null) ? product.getPrice() : 0.0;
                        totalPrice += price * qty;
                %>
                    <li><%= product != null ? product.getName() : "Unknown product" %> - Qty: <%= qty %> @ R<%= String.format("%.2f", price) %></li>
                <%
                    }
                %>
                </ul>
            </td>
            <td><%= order.getOrderDate() %></td>
            <td>R<%= String.format("%.2f", totalPrice) %></td>
            <td>
                <form action="UpdateOrderStatusServlet" method="post" class="d-flex">
                    <input type="hidden" name="orderId" value="<%= order.getId() %>">
                    <select name="status" class="form-select form-select-sm me-2">
                        <option value="Not Shipped" <%= "Not Shipped".equals(order.getStatus()) ? "selected" : "" %>>Not Shipped</option>
                        <option value="Shipped" <%= "Shipped".equals(order.getStatus()) ? "selected" : "" %>>Shipped</option>
                        <option value="Delivered" <%= "Delivered".equals(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                    </select>
                    <button type="submit" class="btn btn-sm btn-primary">Update</button>
                </form>
            </td>
            <td></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="7" class="text-center">No orders found.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
