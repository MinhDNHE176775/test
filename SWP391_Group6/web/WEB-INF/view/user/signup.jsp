<%-- 
    Document   : signup
    Created on : May 14, 2024, 4:03:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="font/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style_1.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xO/6v5UxY+adJ+0SQ3Kyq4lQtW9BpJr1t/5io2RcUEx5ZVvAnSV/cuotfYKw1dVMzXf8lsabB3a4QlhnBfK+0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <style>

            .form-inner form .field select {
                height: 100%;
                width: 100%;
                outline: none;
                padding-left: 15px;
                border-radius: 15px;
                border: 1px solid lightgrey;
                border-bottom-width: 2px;
                font-size: 17px;
                transition: all 0.3s ease;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }


            .field select {
                background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 6"><path fill="none" stroke="%23999" stroke-width="1" d="M1 1l4 4 4-4"/></svg>') no-repeat right 10px center;
                background-size:10px 10px;
            }

            .field {
                position: relative;
                display: flex;
                align-items: center;
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
        <div class="wrapper">
            <a href="home" style="color: #1a75ff;text-decoration: none">Home</a>
            <div class="title-text">
                <div class="title login">
                    <i class="bi bi-person-fill"></i><br>
                    <p style="color: black">Sign up form</p>
<!--                    <p style="color: red; font-weight: lighter; font-size: 15px" class="errorMessage">${requestScope.err}</p>-->
                </div>
            </div>
            <div class="form-container">
                <div class="form-inner">
                    <form action="register" class="signup" method="post" onsubmit="return submitForm()">
                        <div style="display: flex; margin-bottom: 10%;">
                            <div style="margin-right: 10px;width: 49%">
                                <div class="field">
                                    <input type="text" name="name" placeholder="Full Name" required>
                                </div>
                                <div class="name">

                                </div>
                                <div class="field">
                                    <input type="text" name="username" placeholder="Username" required>
                                </div>
                                <div class="username">

                                </div>
                                <div class="field">
                                    <input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Enter a valid email address" placeholder="Email" required>
                                </div>
                                <div class="email">

                                </div>

                                <div class="field">

                                    <select name="gender" id="gender" style="width: 100%;">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>

                                <div class="field">

                                    <select name="role" id="role" style="width: 100%;">
                                        <option value="Mentee">Mentee</option>
                                        <option value="Mentor">Mentor</option>
                                    </select>
                                </div>
                            </div>

                            <div style="margin-left: 60px; width: 49%">
                                <div class="field">
                                    <input id="passw" type="password" name="pass"  placeholder="Password" required>
                                    <i id="iconsee" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                </div>
                                <div class="pass">

                                </div>
                                <div class="field">
                                    <input id="rpassw" type="password" name="re-pass" placeholder="Confirm password" 
                                           required>
                                    <i id="iconsee" onclick="changeIconRp(this)" class="fa-solid fa-eye-slash"></i>
                                </div>
                                <div class="repass">

                                </div>

                                <div class="field">
                                    <input type="text" name="phone" placeholder="Phone" required>
                                </div>
                                <div class="phone">

                                </div>
                                <div class="field">

                                    <input type="date" name="dob" required>
                                </div><br>
                                <div class="dob"></div>
                            </div>
                        </div>
                        <div class="field">
                            <input type="text" name="add" style="width: 100%" placeholder="Address" required>
                        </div>
                        <div class="address">

                        </div>
                        <div class="field btn">
                            <label style="margin-left: 20%">Already have an account?Sign in  <a href="login" style="color: #1a75ff;text-decoration: none">here</a></label>
                        </div>
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Sign up">
                        </div>
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
                var name = $('[name="name"]').val();
                var username = $('[name="username"]').val();
                var pass = $('[name="pass"]').val();
                var repass = $('[name="re-pass"]').val();
                var phone = $('[name="phone"]').val();
                var add = $('[name="add"]').val();
                var gender = $('[name="gender"]').val();
                var dob = $('[name="dob"]').val();
                var email = $('[name="email"]').val();


                function isValidNameFormat(name) {
                    // Regex to check if each word starts with a capital letter and words are separated by a single space
                    const nameFormat = /^[A-ZÀ-Ỹ][a-zà-ỹ]*([ ][A-ZÀ-Ỹ][a-zà-ỹ]*)*$/;
                    return nameFormat.test(name);
                }

// Function to validate the name
                function validateName(name) {
                    let check = true;

                    // Check if name is between 1-50 characters and contains only letters and spaces
                    if (!name.match(/^[A-Za-zÀ-ỹ ]{1,50}$/)) {
                        $(".name").html('<p style="color:red; font-size: 12px;">Name must be between 1-50 characters and contain only letters and spaces.</p>');
                        check = false;
                    }
                    // Check if name has leading or trailing spaces
                    else if (name !== name.trim()) {
                        $(".name").html('<p style="color:red; font-size: 12px;">Name cannot contain leading or trailing spaces.</p>');
                        check = false;
                    }
                    // Check if each word in the name starts with a capital letter
                    else if (!isValidNameFormat(name)) {
                        $(".name").html('<p style="color:red; font-size: 12px;">Each word in the name must start with a capital letter and be separated by a single space.</p>');
                        check = false;
                    }
                    // Clear the error message if the name is valid
                    else {
                        $(".name").empty();
                    }

                    return check;
                }
                // Kiểm tra username
                if (username.length < 6 || username.length > 20) {
                    $(".username").html('<p style="color:red; font-size: 12px;">Username must be between 6-20 characters.</p>');
                    check = false;
                } else if (username !== username.trim()) {
                    $(".username").html('<p style="color:red; font-size: 12px;">Username cannot contain leading or trailing spaces.</p>');
                    check = false;
                } else {
                    $(".username").empty();
                }


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

                //Re - pass
                if (pass !== repass) {
                    $(".repass").html('<p style="color:red; font-size: 12px;">Password does not match</p>');
                    check = false;
                } else {
                    $(".repass").empty();
                }


                // Kiểm tra phone
                if (!phone.match(/^[0-9]{8,14}$/)) {
                    $(".phone").html('<p style="color:red; font-size: 12px;">Phone number must be 8-14 digits.</p>');
                    check = false;
                } else if (phone !== phone.trim()) {
                    $(".phone").html('<p style="color:red; font-size: 12px;">Phone number cannot contain leading or trailing spaces.</p>');
                    check = false;
                } else {
                    $(".phone").empty();
                }


                var currentDate = new Date();

                // Chuyển đổi ngày cụ thể thành đối tượng Date
                var targetDateObj = new Date(dob);

                // Lấy các giá trị năm, tháng và ngày của ngày hiện tại và ngày cụ thể
                var currentYear = currentDate.getFullYear();
                var currentMonth = currentDate.getMonth();
                var currentDay = currentDate.getDate();

                var targetYear = targetDateObj.getFullYear();
                var targetMonth = targetDateObj.getMonth();
                var targetDay = targetDateObj.getDate();

                // So sánh chỉ với năm, tháng và ngày
                if (targetYear > currentYear ||
                        (targetYear === currentYear && targetMonth > currentMonth) ||
                        (targetYear === currentYear && targetMonth === currentMonth && targetDay > currentDay)) {
                    $(".dob").html('<p style="color:red; font-size: 12px;">Date of birth is the future date compared to current date</p>');
                    check = false;
                } else {
                    // Tính tuổi
                    var age = currentYear - targetYear;
                    if (currentMonth < targetMonth || (currentMonth === targetMonth && currentDay < targetDay)) {
                        age--;
                    }

                    // Kiểm tra tuổi
                    if (age < 18) {
                        $(".dob").html('<p style="color:red; font-size: 12px; q">You must be at least 18 years old to register</p>');
                        check = false;
                    } else {
                        $(".dob").empty();
                    }
                }

                if (check) {
                    $.ajax({
                        url: 'checkuser',
                        type: 'POST',
                        data: {username: username, email: email},
                        dataType: 'json',
                        async: false,
                        success: function (response) {
                            if (response.usernameExists) {
                                $(".username").html('<p style="color:red; font-size: 12px;">Username already exists. Please choose another one.</p>');
                                check = false;
                            } else {
                                $(".username").empty();
                            }

                            if (response.emailExists) {
                                $(".email").html('<p style="color:red; font-size: 12px;">Email already exists. Please choose another one.</p>');
                                check = false;
                            } else {
                                $(".email").empty();
                            }
                        }
                    });
                }

                return check;

            }
        </script>
    </body>
</html>