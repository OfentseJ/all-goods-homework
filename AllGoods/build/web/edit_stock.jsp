<%-- 
    Document   : edit_stock
    Created on : 11-May-2025, 18:44:02
    Author     : alexd
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

    List<Product> stockProducts = (List<Product>) request.getAttribute("stockProducts");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product Stock - AllGoods</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container py-4">
        <h2 class="mb-4">Edit Product Stock</h2>

        <%
            if (stockProducts == null || stockProducts.isEmpty()) {
        %>
            <div class="alert alert-info">No products available to edit.</div>
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
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Product p : stockProducts) {
                %>
                    <tr>
                        <form action="UpdatedValuesServlet.do" method="post" class="form-inline">
                            <input type="hidden" name="productId" value="<%= p.getId() %>">
                            <td>
                                <img src="ImageServlet?id=<%= p.getId() %>" alt="Product Image"
                                     style="width: 80px; height: 80px; object-fit: cover; border-radius: 6px;">
                            </td>
                            <td>
                                <div><strong><%= p.getName() %></strong></div>
                                <input type="text" name="newName" class="form-control form-control-sm mt-1" placeholder="Edit name">
                            </td>
                            <td>
                                <div><%= p.getDescription() %></div>
                                <input type="text" name="newDescription" class="form-control form-control-sm mt-1" placeholder="Edit description">
                            </td>
                            <td>
                                <div>R<%= p.getPrice() %></div>
                                <input type="number" step="0.01" name="newPrice" class="form-control form-control-sm mt-1" placeholder="Edit price">
                            </td>
                            <td>
                                <div><%= p.getQuantity() %></div>
                                <input type="number" name="newQuantity" class="form-control form-control-sm mt-1" placeholder="Edit quantity">
                            </td>
                            <td>
                                <button type="submit" class="btn btn-sm btn-success mt-2">Update</button>
                            </td>
                        </form>
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

