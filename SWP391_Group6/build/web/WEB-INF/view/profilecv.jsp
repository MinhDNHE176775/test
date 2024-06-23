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
                width: 200px;
                height: 180px;
                object-fit: cover;
                border: 3px solid #000; /* Add border to avatar */
                border-radius: 50%;
            }
            .img-upload {
                padding: 5px 10px;
                border-style: none;
                border-radius: 10px;
            }
            .form-control {
                word-wrap: break-word;
                overflow-wrap: break-word; /* Ensure long words break */
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: pre-wrap;
                max-width: 200%; /* Ensure content stays within its container */
            }
            .card {
                width: 75%; /* Reduce the width to 75% */
                margin: 0 auto; /* Center the card */
            }
            .card-body {
                padding: 20px;
            }
            .avatar-wrapper {
                background-image: url('resources/images/mentor-cv-background.png');
                background-size: cover;
                background-position: center;
                display: inline-block;
                width: 100%;
                height: 210px;
                padding: 10px;
                position: relative;
            }
            .avatar {
                position: absolute;
                top: 15px;
                left: 30px;
            }
            .btn-nav {
                margin-top: 20px;
                display: flex;
                margin-left: 145px; /* Align with avatar */
            }
            .btn-nav a {
                margin-right: 10px;
                width: 10%; /* Make the buttons smaller */
                background-color: #007bff; /* Set background color */
                color: #fff; /* Set text color */
                text-align: center; /* Center the text */
                padding: 10px; /* Add padding */
                border: none; /* Remove border */
                border-radius: 5px; /* Add border radius */
                text-decoration: none; /* Remove underline */
            }
            .info-section {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                margin-top: 20px;
                margin-left: 30px; /* Align with avatar */
            }
            .info-section .col-md-6 {
                width: 133%; /* Adjust the width of the text boxes to be 1/3 wider */
                margin-bottom: 20px;
            }
            .container-xl {
                margin-bottom: 10%;
            }
        </style>
    </head>
<body>
    <jsp:include page="component/header.jsp"/>
    <p style="color: red; font-weight: lighter; font-size: 20px">${requestScope.err}</p>
    <div class="container-xl">
        <form action="profile_cv" class="signup" method="get" enctype="multipart/form-data" onsubmit="return validateForm()">
            <p style="color: green; font-weight: lighter; font-size: 20px">${requestScope.success}</p>
            <div class="col-xl-12">
                <div class="card mb-4 mb-xl-0" style="margin-top: 100px;">
                    <div class="card-body text-center box_info">
                        <div class="avatar-wrapper">
                            <div class="avatar">
                                <img id="preview" class="preview-img" src="${pageContext.request.contextPath}/resources/images/${mentor.ava}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-12 btn-nav">
                <a href="#" class="btn btn-primary">Profile</a>
                <a href="#" class="btn btn-primary">Rating</a>
            </div>

            <div class="col-xl-12">
                <div class="card mb-4 mb-xl-0" style="margin-top: 20px;">
                    <div class="card-header">MENTOR CV PROFILE</div>
                    <div class="card-body box_info">
                        <div class="info-section">
                            <div class="col-md-6">  
                                <label class="mb-1">Full name</label>
                                <div class="form-control" readonly name="intro">${mentor.name}</div>
                                <p class="username-error" style="color:red"></p>
                            </div>
                            <div class="col-md-6">  
                                <label class="mb-1">Intro</label><br>
                                <div class="form-control" readonly name="intro">${cv.intro}</div>
                            </div>
                            <div class="col-md-6">
                                <label class="mb-1">Achievements</label>
                                <div class="form-control" readonly name="achievement">${cv.achievement}</div>
                            </div>
                            <div class="col-md-6">
                                <label class="mb-1">Experience</label>
                                <div class="form-control" readonly name="experience">${cv.experience} years</div>
                                <p class="email-error" style="color:red"></p>
                            </div>
                            <div class="col-md-6">
                                <label class="mb-1">Certificates</label>
                                <div class="form-control" readonly name="certificate">${cv.certificate}</div>
                            </div>
                            <div class="col-md-6">
                                <label class="mb-1">Skills</label>
                                <div class="form-control" readonly name="skills">${cv.skills}</div>
                            </div>
                        </div>
                        <div class="container mb-3 d-flex justify-content-start align-items-center flex-column">
                            <div class="mb-3 edit">
                                <a href="book_mentor?menid=${requestScope.menid}" class="m-lg-5">
                                    <button type="button" class="btn btn-primary" style="border-style: none; margin-top: 20px; border-radius: 10px; padding: 10px 10px;">
                                        Book Mentor
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        window.onload = function () {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "home", true);
            xhr.send();
        };
        $(document).ready(function () {
            // Bắt sự kiện click trên cả trang
            $(document).on('click', function (event) {
                // Kiểm tra xem sự kiện click có xảy ra trên icon hay không
                if (!$(event.target).closest('.icon').length) {
                    // Nếu không, ẩn icon
                    $('.io').hide();
                }
            });

            // Bắt sự kiện click trên icon
            $('.icon').click(function () {
                $('.io').css('display', 'block');
            });
        });

        function bookSchedule(date, slot) {
            if (window.confirm("Are u sure book with date " + date + ", slot" + slot)) {
                $("#date").val(date);
                $("#slotid").val(slot);
                $("#timetableForm").submit();
            }
        }
    </script>
</body>
</html>
