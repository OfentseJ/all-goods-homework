<%-- 
    Document   : remove-product
    Created on : May 10, 2025, 5:52:40 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="all.goods.entities.Product"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Remove Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Remove Product</h2>
        <table class="table table-bordered table-hover mt-4">
            <thead class="table-light">
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price (R)</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null) {
                        for (Product p : products) {
                %>
                    <tr>
                        <td><img src="ImageServlet?id=<%= p.getId() %>" alt="Product Image" style="width: 80px; height: 80px; object-fit: cover; border-radius: 6px;"></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getDescription() %></td>
                        <td><%= p.getPrice() %></td>
                        <td><%= p.getQuantity() %></td>
                        <td>
                            <form action="RemoveProductServlet" method="post" onsubmit="return confirm('Are you sure you want to remove this product?');">
                                <input type="hidden" name="productId" value="<%= p.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center">No products found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="manager-dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</body>
</html>
