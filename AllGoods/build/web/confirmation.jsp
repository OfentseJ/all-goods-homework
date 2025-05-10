<%-- 
    Document   : confirmation
    Created on : May 10, 2025, 7:06:01 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card text-center shadow-lg">
            <div class="card-body">
                <h1 class="card-title text-success">Thank You!</h1>
                <p class="card-text fs-5">Your order has been placed successfully.</p>

                <%
                    Long orderId = (Long) request.getAttribute("orderId");
                    if (orderId != null) {
                %>
                    <p class="card-text">Order ID: <strong><%= orderId %></strong></p>
                <%
                    }
                %>

                <a href="home.jsp" class="btn btn-primary mt-3">Return to Home</a>
            </div>
        </div>
    </div>
</body>
</html>

