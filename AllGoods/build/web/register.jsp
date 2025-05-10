<%-- 
    Document   : register
    Created on : May 10, 2025, 12:34:03 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - AllGoods</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

<div class="card shadow p-5 text-center" style="width: 100%; max-width: 450px;">
    <h2 class="mb-3">Create an Account</h2>
    <form action="RegisterServlet.do" method="post">
        <div class="form-group mb-3 text-start">
            <label for="username">Full Name</label>
            <input type="text" class="form-control mt-1" id="username" name="username" required>
        </div>
        <div class="form-group mb-3 text-start">
            <label for="email">Email Address</label>
            <input type="email" class="form-control mt-1" id="email" name="email" required>
        </div>
        <div class="form-group mb-3 text-start">
            <label for="address">Shipping Address</label>
            <textarea class="form-control mt-1" id="address" name="address" rows="2" required></textarea>
        </div>
        <div class="form-group mb-4 text-start">
            <label for="password">Password</label>
            <input type="password" class="form-control mt-1" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Register</button>
    </form>
    <div class="mt-3">
        <p class="mb-0">Already have an account?</p>
        <a href="login.jsp" class="btn btn-link text-success">Log in</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

