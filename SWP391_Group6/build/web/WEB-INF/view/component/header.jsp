<%-- 
    Document   : header
    Created on : Jun 7, 2024, 11:19:47 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>StudyLab - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xO/6v5UxY+adJ+0SQ3Kyq4lQtW9BpJr1t/5io2RcUEx5ZVvAnSV/cuotfYKw1dVMzXf8lsabB3a4QlhnBfK+0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .search-form .form-group {
                border: 1px solid #ccc;

                border-radius: 20px;

                overflow: hidden;

            }

            .search-form .form-control {
                border: none;

                box-shadow: none;

            }

            .io{
                background-color: white;
                width: 300px;
                list-style: none;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
            }

            .notification-count {
                position: absolute;
                background-color: red;
                color: white;
                font-size: 12px;
                width: 18px;
                height: 18px;
                border-radius: 50%;
                text-align: center;
                line-height: 18px;
            }

        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a style="font-size: 20px" class="navbar-brand" href="home"><span>Happy</span>Programing</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="home" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Home</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">About</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Contact</a></li>
                            <c:if test="${sessionScope.account != null}">
                                <c:if test="${requestScope.numUnread != null}">
                                <li class="nav-item"><a href="notification" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-bell-fill"></i><span id="notification-count" class="notification-count">${requestScope.numUnread}</span></a></li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.account == null}">
                            <li class="nav-item"><a href="login" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Login</a></li>
                            </c:if>



                        <c:if test="${sessionScope.account.roleid == 4}">
                            <li class="nav-item"><a href="manager" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Dashboard</a></li>
                            <img src="${pageContext.request.contextPath}/resources/uploads/${sessionScope.user.ava}" class="user_img" style="width: 50px; height: 50px; border-radius: 50%; margin: 10px -13px 0 23px;" alt="alt"/>
                            <!--                                <li class="nav-item"><a href="profile" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Profile</a></li>
                                                            <li class="nav-item"><a href="logout" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Log out</a></li>-->

                        </c:if>



                        <c:if test="${sessionScope.account.roleid == 3}">
                            <li class="nav-item"><a href="admin" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Dashboard</a></li>
                            <img src="resources/images/_TUN2441.jpg" class="user_img" style="width: 50px; height: 50px; border-radius: 50%; margin: 10px -13px 0 23px;" alt="alt"/>
                            <!--                                <li class="nav-item"><a href="profile" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Profile</a></li>
                                                            <li class="nav-item"><a href="logout" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Log out</a></li>-->


                        </c:if>







                        <c:if test="${sessionScope.account.roleid == 2}">
                            <img src="${pageContext.request.contextPath}/resources/uploads/${sessionScope.user.ava}" class="user_img" style="width: 50px; height: 50px; border-radius: 50%; margin: 10px -13px 0 23px;" alt="alt"/>
                            <!--                                <li class="nav-item"><a href="profile" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Profile</a></li>
                                                            <li class="nav-item"><a href="logout" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Log out</a></li>-->
                        </c:if>



                        <c:if test="${sessionScope.account.roleid == 1}">
                            <img src="${pageContext.request.contextPath}/resources/uploads/${sessionScope.mentor.ava}" class="user_img" style="width: 50px; height: 50px; border-radius: 50%;margin: 10px -13px 0 23px;" alt="alt"/>
                            <!--                                <li class="nav-item"><a href="profile" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Profile</a></li>
                                                            <li class="nav-item"><a href="logout" class="nav-link " style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);">Log out</a></li>-->
                        </c:if>





                          

                    </ul>
                    <c:if test="${sessionScope.account != null}">
                        <i style="color:black;" class="bi bi-chevron-compact-down icon"></i>
                        <div class="io list-group position-absolute" id="dynamicMenu" style="display: none; margin-left: 563px; margin-top: 200px">
                            <a href="" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4)"><h2><i class="bi bi-person-fill"></i>${sessionScope.account.username}</h2></a>
                            <c:if test="${sessionScope.account.roleid == 4}">
                                <a href="manager_profile" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-person-fill"></i>View profile</a>
                                
                            </c:if>
                                
                               

                            <c:if test="${sessionScope.account.roleid == 2}">
                                <a href="profile" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-person-fill"></i>View profile</a>
                                <a href="list_request" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-card-list"></i> List request</a>
                                <a href="time_table" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-card-list"></i>View schedule</a>
                            </c:if>
                            <c:if test="${sessionScope.account.roleid == 1}">
                                <a href="mentor_profile" class="list-group-item" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-person-fill"></i>View profile</a>
                                <a href="schedule" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-person-fill"></i>Create schedule</a>
                                <a href="view_schedule" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-card-list"></i>View schedule</a>
                                <a href="mentee_request" class="list-group-item list-group-item-action" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-card-list"></i> View mentee request</a>
                            </c:if>
                            <a href="logout" class="nav-link" style="text-shadow: 0 2px 4px rgba(0,0,0,0.4);"><i class="bi bi-box-arrow-left"></i> Log out</a>
                        </div>
                    </c:if>
                </div>

            </div>
            <script>
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
            </script>
        </nav>
        <!-- END nav -->
