<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .profile-img {
                width: 20%;
                height: 40%;
                border-radius: 50%;
            }
            .preview-img {
                display: block;
                margin-top: 10px;
                width: 300px;
                height: 200px;
                object-fit: cover;
            }

            .img-upload{
            
                padding: 5px 10px;
                border-style: none;
                border-radius: 10px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="../component/header.jsp"/>
        <p style="color: red; font-weight: lighter; font-size: 20px">${requestScope.err}</p>
        <div class="container-xl" style="margin-bottom: 10%">
            <form action="profile" class="signup" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <p style="color: green; font-weight: lighter; font-size: 20px">${requestScope.success}</p>
                <div class="row">
                    <div class="col-xl-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header text-center">Profile Avatar</div>
                            <div class="card-body text-center box_info">
                                <div class="avatar">
                                    <input type="file" id="fileUpload" name="avatar" readonly accept=".jpg, .jpeg, .png" style="display: none;" onchange="previewImage(event)">
                                    <img id="preview" class="preview-img" style="margin-left: 20%;border-radius: 50%; width: 200px; height: 200px; border: 1px solid black; margin-bottom: 10px"  src="${pageContext.request.contextPath}/resources/uploads/${sessionScope.user.ava}">
                                    <button type="button" disabled class="img-upload enableUploadImage" onclick="document.getElementById('fileUpload').click()">Click here to upload</button>
                                    <br>
                                    <input type="hidden" name="image-initiate" value="${sessionScope.user.ava}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card-mb-4 mb-xl-0">
                            <div class="card-header">YOUR PROFILE

                            </div>
                            <div class="card-body box_info">

                                <div class="row">
                                    <div class="col-md-6">  
                                        <label class="mb-1" for="inputUsername">Username</label>
                                        <input class="form-control" id="inputUsername" readonly name="username" type="text" placeholder="Enter your username" value="${sessionScope.user.account.username}">
                                        <p class="username-error" style="color:red"></p>
                                    </div>
                                    <div class="col-md-6">  
                                        <label class="mb-1" for="inputDob">Date of birth</label><br>
                                        <input type="date" id="inputDob" class="form-control acceptEdit" name="dob" readonly value="${sessionScope.user.dateOfBirth}">
                                        <p class="dob-error" style="color:red"></p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="mb-1" for="inputFirstName">Full name</label>
                                        <input class="form-control acceptEdit" readonly name="name" id="inputFirstName" type="text" placeholder="Full Name" value="${sessionScope.user.name}">
                                        <p class="name-error" style="color:red"></p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="mb-1" for="inputEmail">Email</label>
                                        <input class="form-control" readonly  name="email" id="inputEmail" type="text" placeholder="Email" value="${sessionScope.user.account.email}">
                                        <p class="email-error" style="color:red"></p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Gender:
                                        </label><br>
                                        <select name="gender" class="form-control acceptEditGender" disabled style="width: 100%">
                                            <option value="Male" <c:if test="${sessionScope.user.gender == true}">selected</c:if>>Male</option>
                                            <option value="Female" <c:if test="${sessionScope.user.gender == false}">selected</c:if>>Female</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label>Address</label><br>
                                        <input class="form-control acceptEdit" name="add"  readonly id="inputAddress" type="text" placeholder="Address" value="${sessionScope.user.address}">
                                    <p class="address-error" style="color:red"></p>
                                </div>

                                <div class="container mb-3" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                                    <div class="mb-3" style="margin-bottom: 10px; margin-left: 470px;">
                                        <a class="btn btn-primary" 
                                           style="border-style: none; border-radius: 10px; text-decoration: none; color: white; display: inline-block; text-align: center; padding: 10px 20px;" 
                                           href="changepass">
                                            Change password
                                        </a>
                                    </div>
                                    <div class="mb-3 edit" style="margin-top: 10px; margin-right: 534px; margin-top: -65px;">
                                        <button type="button" class="btn btn-primary" 
                                                style="border-style: none; border-radius: 10px; padding: 10px 20px;" 
                                                onclick="acceptRead()">Edit profile</button>
                                    </div>
                                    <div class="mb-3 saveButton" style="margin-top: 10px; margin-right: 420px; margin-top: -65px; display: none;">
                                        <div class="btn-layer"></div>
                                        <input type="submit" class="btn btn-primary w-25" 
                                               style="border-style: none; border-radius: 10px; padding: 0px 119px 0 9px;" 
                                               value="Update profile">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script>
            $(document).ready(function () {
                $(".wrapper").hide();
                $(".wrapper").slideDown(500).fadeIn({duration: 250, queue: false});
            });

            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('preview');
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            }

            function acceptRead() {
                $(".acceptEdit").attr('readonly', false);
                $(".acceptEditGender").attr('disabled', false);
                $(".enableUploadImage").attr('disabled', false);
                $(".edit").css('display', 'none');
                $(".saveButton").css('display', 'block');
            }

            function validateForm() {
                let check = true;
                // Clear previous error messages
                $(".username-error").text("");
                $(".email-error").text("");
                $(".dob-error").text("");
                $(".name-error").text("");
                $(".address-error").text("");

                // Get values
//                var username = $('[name="username"]').val();
//                var email = $('[name="email"]').val();
//                var dob = $('[name="dob"]').val();
//                var name = $('[name="name"]').val().trim();
//                var address = $('[name="add"]').val().trim();


        // Get values and trim leading/trailing spaces
        var username = $('[name="username"]').val().trim();
        var email = $('[name="email"]').val().trim();
        var dob = $('[name="dob"]').val().trim();
        var name = $('[name="name"]').val().trim();
        var address = $('[name="add"]').val().trim();

  
        var multipleSpacesPattern = /\s{2,}/;
        var numbersPattern = /[0-9]/;
        var specialCharsPattern = /[!@#$%^&*(),.?":{}|<>]/;
        if (name.length === 0) {
            $(".name-error").text("Full name cannot be empty.");
            check = false;
        } else if (multipleSpacesPattern.test(name)) {
            $(".name-error").text("Full name cannot contain multiple consecutive spaces.");
            check = false;
        } else if (numbersPattern.test(name)) {
            $(".name-error").text("Full name cannot contain numbers.");
            check = false;
        } else if (specialCharsPattern.test(name)) {
            $(".name-error").text("Full name cannot contain special characters.");
            check = false;
        } else if (name !== $('[name="name"]').val()) {
            $(".name-error").text("Full name cannot have leading or trailing spaces.");
            check = false;
        }


        // Validate address
        if (address.length === 0) {
            $(".address-error").text("Address cannot be empty.");
            check = false;
        } else if (multipleSpacesPattern.test(address)) {
            $(".address-error").text("Address cannot contain multiple consecutive spaces.");
            check = false;
        } else if (address !== $('[name="add"]').val()) {
            $(".address-error").text("Address cannot have leading or trailing spaces.");
            check = false;
        }


                // Validate date of birth (at least 18 years old)
                var currentDate = new Date();
                var targetDateObj = new Date(dob);
                var currentYear = currentDate.getFullYear();
                var currentMonth = currentDate.getMonth();
                var currentDay = currentDate.getDate();
                var targetYear = targetDateObj.getFullYear();
                var targetMonth = targetDateObj.getMonth();
                var targetDay = targetDateObj.getDate();
                if (targetYear > currentYear ||
                        (targetYear === currentYear && targetMonth > currentMonth) ||
                        (targetYear === currentYear && targetMonth === currentMonth && targetDay > currentDay)) {
                    $(".dob-error").text("Date of birth is a future date compared to the current date.");
                    check = false;
                } else {
                    // Calculate age
                    var age = currentYear - targetYear;
                    if (currentMonth < targetMonth || (currentMonth === targetMonth && currentDay < targetDay)) {
                        age--;
                    }

                    // Check age
                    if (age < 18) {
                        $(".dob-error").text("You must be at least 18 years old.");
                        check = false;
                    }
                }

                return check;
            }
        </script>
    </body>
</html>
