<%-- 
    Document   : view-products
    Created on : May 10, 2025, 6:13:56 PM
    Author     : user
--%>

<%@ page import="all.goods.entities.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom grid styling for product cards */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            transition: transform 0.2s ease-in-out;
        }
        .product-card img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }
        .product-card:hover {
            transform: translateY(-10px);
        }
    </style>
</head>
<body>

<!-- Container for page content -->
<div class="container mt-4">
    <h2 class="text-center mb-4">Available Products</h2>

    <!-- Product grid using Bootstrap grid system -->
    <div class="product-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card shadow-sm">
                <!-- Product Image -->
                <img src="ImageServlet?id=${product.id}" alt="${product.name}" class="img-fluid" />
                
                <!-- Product Details -->
                <h3 class="mt-3">${product.name}</h3>
                <p class="text-muted">${product.description}</p>
                <p><strong>Price:</strong> R${product.price}</p>
                <p><strong>Stock:</strong> ${product.quantity}</p>
                
                <!-- Add to Cart Button -->
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
                </form>
            </div>
        </c:forEach>
    </div>
    <hr>
    
    <!-- Cart Link -->
    <a href="cart.jsp" class="btn btn-success">View Cart</a>
    
    <!-- Logout Button -->
    <a href="logout.jsp" class="btn btn-outline-danger">Logout</a>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>
</html>
