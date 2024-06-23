<%-- 
    Document   : kk
    Created on : Jun 10, 2024, 10:59:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="test_date" method="get">
            <input type="datetime-local" name="kk">
            <input type="submit" value="submit">
        </form>
        Date:${requestScope.kkk}
    </body>
</html>
