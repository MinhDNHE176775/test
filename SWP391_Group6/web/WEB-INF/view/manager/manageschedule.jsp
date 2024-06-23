<%-- 
    Document   : manageschedule
    Created on : Jun 23, 2024, 10:08:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #fbfbfb;
                display: grid;
            }
            @media (min-width: 991.98px) {
                main {
                    padding-left: 270px;
                }
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 270px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }
            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }

            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }
            .overlay1 {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.2); /* Semi-transparent background */
                display: flex;
                justify-content: center;
                align-items: center;
                margin-left: 21%;
                z-index: 1000;
            }
            #acceptReason {
                width: 100%; /* Adjust width as needed */
                max-width: 500px; /* Ensure it doesn't get too wide */
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            .header {
                height: 50px; /* Fixed height for header */
                background-color: #004085; /* Header background color */
                color: #fff; /* Header text color */
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2em;
                font-weight: bold;
            }
            .content {
                padding: 20px;
                text-align: center;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css">
        <link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">


        <jsp:include page="leftdb.jsp"></jsp:include>
        <jsp:include page="headermn.jsp"></jsp:include>
        </head>
        <body>
            <main>
                <div class="container pt-4">          
                    <section class="mb-4">
                        <div class="card">
                            <div class="row" style="">
                                <div class="col-lg-4" style="text-align: center; margin-top: 20px; margin-bottom: 20px;padding-top: 20px">
                                    <h3 class="mb-0" id="">
                                        <strong>Manage Schedule</strong>
                                    </h3>
                                </div>

                                <div class="col-lg-6" style="text-align: center; margin-top: 20px; margin-bottom: 20px;padding-top: 20px;">
                                </div>
                            </div>
                        </div>
                    <c:if test="${sessionScope.mess != null}">
                        <div class="alert alert-success" style="background-color: #d4edda; border-color: #c3e6cb; color: #155724;">
                            ${sessionScope.mess}
                            <% request.getSession().removeAttribute("mess");%>

                        </div>
                    </c:if>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-nowrap">
                                <thead>
                                    <tr>
                                        <th class="text_page_head" scope="col">ID</th>
                                        <th class="text_page_head" scope="col">Date</th>
                                        <th class="text_page_head" scope="col">Slot</th> 
                                        <th class="text_page_head" scope="col">Status</th> 
                                        <th class="text_page_head" scope="col">Username</th> 
                                        <th style="text-align: center;" class="text_page_head" scope="col">Actions</th> 
                                    </tr>
                                </thead>
                                <tbody id="contentt">
                                    <c:forEach items="${requestScope.sessions}" var="s">
                                        <tr>
                                            <td class="text_page">${s.id}</td>
                                            <td class="text_page">${s.date}</td>
                                            <td class="text_page">${s.slot.id}(${s.slot.from} - ${s.slot.to})</td>
                                            <td class="text_page" style="color: green">${s.status}</td>
                                            <td class="text_page">${s.mentor.account.username}</td>
                                            <td class="text_page" style="padding: 10px 2px 14px; text-align: center;">
                                                <div class="d-flex justify-content-center">
                                                    <form action="manage_schedule" method="post" class="mr-2" id="acceptForm">
                                                        <input type="hidden" name="action" value="accept">
                                                        <input type="hidden" name="sesid" value="${s.id}"/>
                                                        <button type="submit" class="btn btn-success">
                                                            Accept
                                                        </button>
                                                    </form> 
                                                    <form action="manage_schedule" method="post" id="rejectForm">
                                                        <input type="hidden" name="action" value="reject">
                                                        <input type="hidden" name="sesid" value="${s.id}"/>
                                                        <input type="hidden" name="pickedDate" value="${s.date}"/>
                                                        <input type="hidden" name="pickedSlot" value="${s.slot.id}"/>
                                                        <button type="button" class="btn btn-danger" onclick="dd()">
                                                            Reject
                                                        </button>
                                                        <div class="overlay1" style="display: none">
                                                            <div id="acceptReason">
                                                                <div class="header">Message</div>
                                                                <textarea rows="4" name="reason" class="w-100" placeholder="Enter your reason to accept.."></textarea>
                                                                <div class="d-flex justify-content-center">
                                                                    <button type="button" class="btn btn-danger mr-3"  onclick="$('.overlay1').css('display', 'none')">Close</button>
                                                                    <button type="button" class="btn btn-success" onclick="$('#rejectForm').submit()">Submit</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form> 
                                                </div>
                                            </td> 
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>

        </main>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script>
                                                                        function dd() {
                                                                            $(".overlay1").css("display", "block");
                                                                        }
        </script>
    </body>
</html>

