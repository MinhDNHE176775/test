<%-- 
    Document   : home
    Created on : May 21, 2024, 10:30:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Homepage</title>
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


        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xO/6v5UxY+adJ+0SQ3Kyq4lQtW9BpJr1t/5io2RcUEx5ZVvAnSV/cuotfYKw1dVMzXf8lsabB3a4QlhnBfK+0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
            
            .project-wrap {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
                transition: box-shadow 0.3s ease-in-out; 
            }

            .project-wrap:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); 
            }

            .img {
                display: block;
                height: 150px; 
                background-size: cover;
                background-position: center;
            }

            .text {
                padding: 20px;
                background-color: #E1E4E3;
            }

        </style>
    </head>

    <body>
        <jsp:include page="WEB-INF/view/component/header.jsp"/>
        <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg'); height: 450px;">

            <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate pb-5 text-center">
                        <h1 class="mb-0 bread">Home</h1>
                    </div>
                </div>
            </div>

        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="bg-white ftco-animate">
                            <form action="search_skill" method="post" class="search-form" style="position: relative; display: flex; align-items: center;">
                                <div class="form-group" style="flex-grow: 1;">
                                    <input name="key" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" type="text" placeholder="Search skill name" style="width: 100%; padding: 7px 10px; border-radius: 15px;">
                                </div>
                                <button type="submit" style="background: none; border: none; position: absolute; right: 10px; cursor: pointer; top: 4px;">
                                    <i class="fas fa-search"></i>
                                </button>
                            </form>

                        </div>
                    </div>
                </div>

                <c:if test="${not empty noResults}">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="bg-white ftco-animate">
                                <p>No results found</p>
                            </div>
                        </div>
                    </div>
                </c:if>


                <c:if test="${empty noResults}">
                    <div class="row">
                        <c:forEach var="c" items="${sessionScope.pagedSkills}">
                            <div class="col-md-6 d-flex align-items-stretch ftco-animate">
                                <div class="project-wrap">
                                    <a href="list_mentor?id=${c.id}" class="img" style="background-image: url(resources/uploads/skill/${c.ava});">
                                        <span class="price">${c.skillname}</span>
                                    </a>
                                    <div class="text p-4">
                                        <h3><a href="list_mentor?id=${c.id}">${c.shortdescription}</a></h3>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>


                <div class="row justify-content-center">
                    <myTag:myPagination currentPage="${requestScope.page}" subject="home" totalPages="${requestScope.num}"></myTag:myPagination>
                    </div>
                </div>
            </section>

        <jsp:include page="WEB-INF/view/component/footer.jsp"/>

        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
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
        </script>

    </body>
</html>