<%-- 
    Document   : admin-panel
    Created on : May 10, 2025, 7:13:24 PM
    Author     : user
--%>

<%@ page import="all.goods.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - AllGoods</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Admin Panel</h2>

    <h4>Manage Users</h4>
    <table class="table table-bordered table-striped mt-4">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.userRole}</td>
                <td>
                    <form action="RoleChangeServlet" method="post" style="display:inline;">
                        <input type="hidden" name="userId" value="${user.id}">
                        <select name="newRole" class="form-select" style="display:inline; width:auto;">
                            <option value="customer" ${user.userRole == 'customer' ? 'selected' : ''}>Customer</option>
                            <option value="manager" ${user.userRole == 'manager' ? 'selected' : ''}>Manager</option>
                        </select>
                        <button type="submit" class="btn btn-sm btn-warning">Change Role</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="mt-4">
        <a href="home.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</div>

</body>
</html>
