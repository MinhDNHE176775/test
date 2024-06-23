<%-- 
    Document   : header
    Created on : Jun 3, 2024, 12:08:40 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Happy Programing Group 6</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xO/6v5UxY+adJ+0SQ3Kyq4lQtW9BpJr1t/5io2RcUEx5ZVvAnSV/cuotfYKw1dVMzXf8lsabB3a4QlhnBfK+0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .search-form .form-group {
                border: 1px solid #ccc;

                border-radius: 20px;

                overflow: hidden;

            }

            .search-form .form-control {
                border: none;

                box-shadow: none;

            }

            .bg-black {
                background-color: #000000 !important;
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-black" id="ftco-navbar">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="home" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Home</a></li>
                <li class="nav-item"><a href="about.html" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">About</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Contact</a></li>
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item"><a href="login" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Login</a></li>
                </c:if>
               
                <c:if test="${sessionScope.account != null}">
                    <li class="nav-item"><a href="profile" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Profile</a></li>
                    <li class="nav-item"><a href="logout" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Log out</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
</html>