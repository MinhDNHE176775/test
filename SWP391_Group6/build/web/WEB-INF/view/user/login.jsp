<%-- 
    Document   : login
    Created on : May 13, 2024, 10:55:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xO/6v5UxY+adJ+0SQ3Kyq4lQtW9BpJr1t/5io2RcUEx5ZVvAnSV/cuotfYKw1dVMzXf8lsabB3a4QlhnBfK+0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .field {
                position: relative;
                display: flex;
                align-items: center;
            }

            .field input {
                width: 100%;
                padding-right: 30px; 
            }

            .field i {
                position: absolute;
                right: 10px; 
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <div class="wrapper" style="width: 400px">
            <a href="home" style="color: #1a75ff;text-decoration: none">Home</a>
            <div class="title-text">
                <div class="title login">
                    <i class="bi bi-person-fill"></i><br>
                    Login Form
                    <p style="color: green; font-weight: lighter; font-size: 15px">${requestScope.success}</p>
                    <p style="color: red; font-weight: lighter; font-size: 15px">${requestScope.err}</p>
                    <p style="color: green; font-weight: lighter; font-size: 15px">${requestScope.reset_success}</p>
                </div>
            </div>
            <div class="form-container">
                <p style="color: red">${requestScope.error}</p>
                <div class="form-inner">
                    <form action="login" class="login" method="post">
                        <div class="field">
                            <input type="text" name="username" value="${requestScope.user}" pattern="^\S{1,}$" placeholder="Username" required>
                        </div>

                        <div class="field">
                            <input id="pass" type="password" name="password" pattern="^\S{1,}$" value="${requestScope.pass}" placeholder="Password" required>
                            <i id="iconsee" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                        </div>

                        <div class="pass-link">
                            <input type="checkbox" name="rememberMe" value="remember" <c:if test="${not empty requestScope.rememberMe}">checked</c:if>> Remember me
                            <a href="forgot" style="margin-left: 15%;color: #1a75ff;text-decoration: none">Forgot password?</a>
                        </div>

                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Login">
                        </div>
                        <div class="signup-link">Not a member? <a href="register" style="color: #1a75ff;text-decoration: none">Signup now</a></div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function changeIcon(obj) {
                var inputP = document.querySelector("#pass");
                console.log(inputP)
                if (obj.className == 'fa-solid fa-eye-slash') {
                    obj.className = 'fa-solid fa-eye';
                    inputP.type = 'text';
                } else {
                    obj.className = 'fa-solid fa-eye-slash';
                    inputP.type = 'password';
                }
            }
        </script>
    </body>
</html>
