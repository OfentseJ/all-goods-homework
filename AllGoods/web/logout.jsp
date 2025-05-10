<%-- 
    Document   : logout
    Created on : May 10, 2025, 5:05:11 PM
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log out the user
    session.invalidate();
    // Redirect to the welcome page or login
    response.sendRedirect("index.html");
%>