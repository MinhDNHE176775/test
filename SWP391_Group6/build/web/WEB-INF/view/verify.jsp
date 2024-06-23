

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="font/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style_1.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css"/>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <style>
           
        </style>
    </head>
    <body>
        <section class="wrapper">
             <a href="login" style="color: #1a75ff;text-decoration: none">Back to login</a>
            <p style="color: red">${requestScope.err}</p>
            <header style="text-align: center">A password confirm was sent to email ${sessionScope.email}.Please check your mail</header>
            <form action="verify" method="post">
                    <input type="text" name="passconfirm" placeholder="Enter verification code">
                    <input type="submit" class="su" value="Verify" />
                </form>
        </section>
    </body>
</html>
