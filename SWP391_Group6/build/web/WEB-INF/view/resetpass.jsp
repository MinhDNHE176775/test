<%-- 
    Document   : resetpass
    Created on : May 25, 2024, 5:43:52 PM
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

                    <br>
                    Reset password form
                    <p style="color: red; font-weight: lighter; font-size: 15px">${requestScope.err}</p>
                </div>
            </div>
            <div class="form-container">
                <p style="color: red">${requestScope.error}</p>
                <div class="form-inner">
                    <form action="forgot" class="login" method="post" onsubmit="return submitForm()">
                        <div class="field">
                            <input id="passw" type="password" name="pass" placeholder="Password" required>
                             <i id="iconsee" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                        </div>
                        <div class="pass">

                        </div>
                        <div class="field">
                            <input id="rpassw" type="password" name="re-pass" placeholder="Confirm password" required>
                              <i id="iconsee" onclick="changeIconRp(this)" class="fa-solid fa-eye-slash"></i>
                        </div>
                        <div class="repass">

                        </div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Enter">
                        </div>
                        <input type="hidden" name="status" value="Done">
                    </form>
                </div>
            </div>
        </div>
        <script>
              function changeIcon(obj) {
                var inputP = document.querySelector("#passw");
                console.log(inputP)
                if (obj.className == 'fa-solid fa-eye-slash') {
                    obj.className = 'fa-solid fa-eye';
                    inputP.type = 'text';
                } else {
                    obj.className = 'fa-solid fa-eye-slash';
                    inputP.type = 'password';
                }
            }
            function changeIconRp(obj) {
                var inputP = document.querySelector("#rpassw");
                console.log(inputP)
                if (obj.className == 'fa-solid fa-eye-slash') {
                    obj.className = 'fa-solid fa-eye';
                    inputP.type = 'text';
                } else {
                    obj.className = 'fa-solid fa-eye-slash';
                    inputP.type = 'password';
                }
            }

            function submitForm() {
                let check = true;

                var pass = $('[name="pass"]').val();
                var repass = $('[name="re-pass"]').val();

                // Kiểm tra pass
                if (pass.length < 6 || pass.length > 20) {
                    $(".pass").html('<p style="color:red; font-size: 12px;">Password must be 6-20 characters long.</p>');
                    check = false;
                } else if (pass !== pass.trim()) {
                    $(".pass").html('<p style="color:red; font-size: 12px;">Password cannot contain leading or trailing spaces.</p>');
                    check = false;
                } else {
                    $(".pass").empty();
                }

                if (pass !== repass) {
                    $(".repass").html('<p style="color:red; font-size: 12px;">Password does not match</p>');
                    check = false;
                } else {
                    $(".repass").empty();
                }
                return check;
            }

        </script>
    </body>
</html>