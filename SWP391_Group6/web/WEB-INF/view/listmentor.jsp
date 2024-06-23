<%-- 
    Document   : listmentor
    Created on : Jun 1, 2024, 10:37:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Skill detail and mentors</title>
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
            .custom-hr {
                border: none;
                height: 3px;
                background-color: #333;
                margin: 20px 0;
            }
            .card {
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #f8f9fa;
                font-weight: bold;
            }

            .card-body {
                background-color: #fff;
            }

            .input-group {
                display: flex;
                justify-content: space-between;
            }

            .input-group input {
                flex: 1;
            }

            .input-group button {
                margin-left: 10px;
            }

            .project-wrap {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Bóng mờ */
                transition: box-shadow 0.3s ease-in-out; /* Hiệu ứng chuyển đổi khi hover */
                border-radius: 10px; /* Tạo góc bo tròn */
                overflow: hidden; /* Đảm bảo bóng không bị cắt */
            }

            .project-wrap:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Bóng mờ khi hover */
            }

            .img {
                display: block;
                height: 180px; /* Giảm chiều cao */
                background-size: cover;
                background-position: center;
            }

            .text {
                padding: 15px; /* Giảm padding */

            }

            .checked {
                color: orange;
            }


        </style>
    </head>

    <body>
        <jsp:include page="component/header.jsp"/>
        <section class="ftco-section bg-light">
            <div class="container-xl" style="margin-bottom: 5%; margin-top: 5%">
                <form>
                    <h2>Skill</h2>
                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card mb-4 mb-xl-0">
                                <div class="card-header text-center">${skill.skillname}</div>
                                <div class="card-body text-center box_info">
                                    <div class="avatar">
                                        <img src="${pageContext.request.contextPath}/resources/uploads/skill/${skill.ava}" alt="${skill.skillname}" style="width: 100px; height: 100px; border-radius: 50%;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <div class="card mb-4 mb-xl-0">
                                <div class="card-header">Description</div>
                                <div class="card-body box_info">
                                    <p>${skill.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="custom-hr">
                    <h2>Mentors</h2>
                </form>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <!-- Search and Filter Section -->
                        <div class="card mb-4">
                            <div class="card-header">Search Mentor</div>
                            <div class="card-body">
                                <form action="search_mentor" class="search-form" style="position: relative; display: flex; align-items: center;">
                                    <input type="hidden" name="id" value="${requestScope.skillid}"/>
                                    <div class="form-group" style="flex-grow: 1;">
                                        <input name="key" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" type="text" placeholder="Search mentor" style="width: 100%; padding: 7px 10px; border-radius: 15px;">
                                    </div>
                                    <button type="submit" style="background: none; border: none; position: absolute; right: 10px; cursor: pointer; top: 6px;">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">Filter by Years of Experience</div>
                            <div class="card-body">
                                <form action="filter_mentor_by_YoE" method="get">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="experience" value="1-2" id="experience1-2">
                                        <label class="form-check-label" for="experience1-2">1 - 2 years</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="experience" value="3-4" id="experience3-4">
                                        <label class="form-check-label" for="experience3-4">3 - 4 years</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="experience" value="5-7" id="experience5-7">
                                        <label class="form-check-label" for="experience5-7">5 - 7 years</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="experience" value=">7" id="experience>">
                                        <label class="form-check-label" for="experience>7">More than 7 years</label>
                                    </div>
                                    <!-- Add more categories as needed -->
                                    <button class="btn btn-primary mt-3" type="submit">Filter</button>
                                </form>
                            </div>
                        </div>



                        <div class="card mb-4">
                            <div class="card-header">Filter by Rating</div>
                            <div class="card-body">
                                <form action="filter_mentor" method="get">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="rating" value="5" id="rating5">
                                        <label class="form-check-label" for="rating5">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="rating" value="4" id="rating4">
                                        <label class="form-check-label" for="rating4">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star"></span>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="rating" value="3" id="rating3">
                                        <label class="form-check-label" for="rating3">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="rating" value="2" id="rating2">
                                        <label class="form-check-label" for="rating2">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="rating" value="1" id="rating1">
                                        <label class="form-check-label" for="rating1">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </label>
                                    </div>
                                    <button class="btn btn-primary mt-3" type="submit">Filter</button>
                                </form>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach var="c" items="${sessionScope.pagedMentors}">
                                <div class="col-md-6 d-flex align-items-stretch ftco-animate">
                                    <div class="project-wrap">
                                        <a href="profile_cv?menid=${c.id}" class="img" style="background-image: url(assets/uploads/skill/${c.ava});">
                                            <span class="price">${c.name}</span>
                                        </a>
                                        <div class="text p-4">
                                            <ul class="d-flex justify-content-between">
                                                <li class="m-auto"><a style="padding: 5px 10px; background-color: buttonface; border-radius: 10px" href="book_mentor?menid=${c.id}">Book mentor</a></li>
                                                <li class="m-auto"><a style="padding: 5px 10px; background-color: buttonface; border-radius: 10px" href="profile_cv?menid=${c.id}">View mentor</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${empty pagedMentors}">
                                <p>No mentors found for this skill.</p>
                            </c:if>
                        </div>
                      
                    </div>
                                    
                                      <myTag:myPagination currentPage="${requestScope.page}" subject="list_mentor" totalPages="${requestScope.num}" appendQueryString="&id=${requestScope.skillid}"/>
                                      
                </div>
            </div>
        </section>

        <jsp:include page="component/footer.jsp"/>


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