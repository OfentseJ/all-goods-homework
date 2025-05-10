<%-- 
    Document   : login
    Created on : May 10, 2025, 12:33:34 PM
    Author     : user
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - AllGoods</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

<div class="card shadow p-5 text-center" style="width: 100%; max-width: 400px;">
    <h2 class="mb-3">Login to <span class="text-success">AllGoods</span></h2>
    <form action="login" method="post">
        <div class="form-group mb-3 text-start">
            <label for="email">Email address</label>
            <input type="email" class="form-control mt-1" id="email" name="email" required>
        </div>
        <div class="form-group mb-4 text-start">
            <label for="password">Password</label>
            <input type="password" class="form-control mt-1" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Login</button>
    </form>
    <div class="mt-3">
        <p class="mb-0">Don't have an account?</p>
        <a href="register.jsp" class="btn btn-link text-success">Create one</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
