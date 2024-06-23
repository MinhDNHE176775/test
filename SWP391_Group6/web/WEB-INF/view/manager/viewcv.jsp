<%-- 
    Document   : viewcv
    Created on : Jun 8, 2024, 11:44:53 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                background-color: green;
                padding: 5px 10px;
                border-style: none;
                border-radius: 10px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="../component/header.jsp"/>
        <div class="container-xl" style="margin-top: 10%">
            <form action="mentor_cv" class="signup" method="post" enctype="multipart/form-data">
                <p style="color: green; font-weight: lighter; font-size: 20px">${requestScope.success}</p>
                <div class="row">
                    <div class="col-xl-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header text-center">Profile Avatar</div>
                            <div class="card-body text-center box_info">
                                <div class="avatar">
                                    <input type="file" id="fileUpload" name="avatar" accept=".jpg, .jpeg, .png" style="display: none;" onchange="previewImage(event)">
                                    <img id="preview" class="preview-img" style="margin-left: 20%;border-radius: 50%; width: 200px; height: 200px; border: 1px solid black; margin-bottom: 10px"  src="${pageContext.request.contextPath}/assets/uploads/cv/${requestScope.cv.avatar}">
                                    <button type="button" class="img-upload" onclick="document.getElementById('fileUpload').click()">Click here to upload</button>
                                    <br>
                                    <input type="hidden" name="image-initiate" value="${sessionScope.user.ava}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card-mb-4 mb-xl-0">
                            <div class="card-header">Introduction</div>
                            <div class="card-body box_info">
                                 <textarea id="intro" name="intro" placeholder="Write your introduction here..." style="width: 100%"
                                           required><c:out value="${requestScope.cv.intro}"/></textarea><br>
                            </div>
                        </div>
                        <div class="card-mb-4 mb-xl-0">
                            <div class="card-header">Achievement</div>
                            <div class="card-body box_info">
                                 <textarea id="intro" name="achivement" placeholder="Write your achivement here..." style="width: 100%"
                                           required><c:out value="${requestScope.cv.achievement}"/></textarea><br>
                            </div>
                        </div>
                        <div class="card-mb-4 mb-xl-0">
                            <div class="card-header">Experience</div>
                            <div class="card-body box_info">
                                 <textarea id="intro" name="experience" placeholder="Write your experience here..." style="width: 100%"
                                           required><c:out value="${requestScope.cv.experience}"/></textarea><br>
                            </div>
                        </div>
                        <div class="card-mb-4 mb-xl-0">
                            <div class="card-header">Certificate</div>
                            <div class="card-body box_info">
                                 <input type="text" name="cert" value="${requestScope.cv.certificate}" placeholder="Put your certificate link here" style="width: 100%"/>
                                <p>Cerificate link:<a href="${requestScope.cv.certificate}" target="target">Link</a></p>
                            </div>
                        </div>
                        <div class="card-mb-4 mb-xl-0">
                            <div class="card-header">Skills </div>
                            <c:forEach items="${requestScope.cvSkills}" var="s">
                                ${s}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="mb-3" style="margin-left: 50%; margin-top: 5%">
                </div>
            </form>
        </div>


        <script>
            $(document).ready(function () {
                // Ẩn phần tử container trước
                $(".wrapper").hide();
                // Áp dụng hiệu ứng kết hợp fadeIn và slideDown trong 2000ms (2 giây)
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

        </script>
    </body>
</html>

