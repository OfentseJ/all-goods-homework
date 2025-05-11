<%-- 
    Document   : low-stock
    Created on : May 10, 2025, 5:08:33 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="all.goods.entities.Product" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null ||
        !"manager".equals(((all.goods.entities.User) session.getAttribute("user")).getUserRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Product> lowStockProducts = (List<Product>) request.getAttribute("lowStockProducts");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Low Stock Products - AllGoods</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container py-4">
        <h2 class="mb-4">Low Stock Products</h2>

        <%
            if (lowStockProducts == null || lowStockProducts.isEmpty()) {
        %>
            <div class="alert alert-success">No products are low on stock.</div>
        <%
            } else {
        %>
            <table class="table table-bordered table-striped bg-white shadow-sm">
                <thead class="thead-dark">
                    <tr>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Restock</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Product p : lowStockProducts) {
                %>
                    <tr>
                        <td><img src="ImageServlet?id=<%= p.getId() %>" alt="Product Image" style="width: 80px; height: 80px; object-fit: cover; border-radius: 6px;"></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getDescription() %></td>
                        <td>R<%= p.getPrice() %></td>
                        <td><%= p.getQuantity() %></td>
                        <td>
                            <form action="RestockProductServlet" method="post" class="form-inline">
                                <input type="hidden" name="productId" value="<%=p.getId()%>">
                                <input type="number" name="restockAmount" class="form-control form-control-sm mr-2" min="1" required>
                                <button type="submit" class="btn btn-sm btn-primary">Restock</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        <%
            }
        %>
        <a href="manager-dashboard.jsp" class="btn btn-outline-secondary mt-3">Back to Dashboard</a>
    </div>
</body>
</html>
