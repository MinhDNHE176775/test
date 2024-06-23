<%-- 
    Document   : defaultpass
    Created on : May 25, 2024, 5:03:59 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper" style="width: 400px">
            <a href="login" style="color: #1a75ff;text-decoration: none">Back to login</a>
            <div class="title-text">
                <div class="title login">
                   
                    <p style="font-size: 16px;">Enter your default pass which sent to your email</p>
                    <p style="color: red; font-weight: lighter; font-size: 15px">${requestScope.err}</p>
                </div>
            </div>
            <div class="form-container">
                <p style="color: red">${requestScope.error}</p>
                <div class="form-inner">
                    <form action="forgot" class="login" method="post">
                        <div class="field">
                            <input type="text" name="de-pass"  placeholder="Default pass" required>
                        </div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Enter">
                        </div>
                        <input type="hidden" name="status" value="Progress">
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

