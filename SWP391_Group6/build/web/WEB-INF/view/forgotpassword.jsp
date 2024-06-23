<%-- 
    Document   : forgotpassword
    Created on : May 25, 2024, 11:50:00 AM
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xO/6v5UxY+adJ+0SQ3Kyq4lQtW9BpJr1t/5io2RcUEx5ZVvAnSV/cuotfYKw1dVMzXf8lsabB3a4QlhnBfK+0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Forgot password</title>
    </head>
    <body>
        <div class="wrapper" style="width: 400px">
            <a href="login" style="color: #1a75ff;text-decoration: none">Back to login</a>
            <div class="title-text">
                <div class="title login">
                    <i class="bi bi-person-fill"></i><br>
                    Forgot Form
                    <p style="color: red; font-weight: lighter; font-size: 15px">${requestScope.err}</p>
                </div>
            </div>
            <div class="form-container">
                <p style="color: red">${requestScope.error}</p>
                <div class="form-inner">
                    <form action="forgot" class="login" method="post">
                        <div class="field">
                            <input type="text" name="username" placeholder="Enter your username" required>
                        </div>
                        <div class="field">
                            <input type="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Submit form">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // Ẩn phần tử container trước
                $(".wrapper").hide();
                // Áp dụng hiệu ứng kết hợp fadeIn và slideDown trong 2000ms (2 giây)
                $(".wrapper").slideDown(500).fadeIn({duration: 500, queue: true});
            });
        </script>
    </body>
</html>

