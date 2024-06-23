<%-- 
    Document   : skills
    Created on : Jun 3, 2024, 12:09:03 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags/" %>
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
        </style>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css">
        <link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">
    </head>
    <body>
        <header>
            <jsp:include page="leftdb.jsp"></jsp:include>
            </header>
        <jsp:include page="headermn.jsp"></jsp:include>
            <main>
    <div class="container pt-4">          
        <section class="mb-4">
            <div class="card">
                <div class="row" style="">
                    <div class="col-lg-4" style="text-align: center; margin-top: 20px; margin-bottom: 20px;padding-top: 20px">
                        <h3 class="mb-0" id="">
                            <strong>Manage Mentors</strong>
                        </h3>
                    </div>
                    <div class="col-lg-6" style="text-align: center; margin-top: 20px; margin-bottom: 20px;padding-top: 20px;">
                        <form action="manageMentor" method="post" style="display: flex; justify-content: center">
                            <input name="valueSearch" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}"  type="text" placeholder="Search mentor name" style="width: 60%; padding: 4px 10px; border-radius: 15px">
                            <button type="submit" style="border-radius: 50%; width: 40px; font-size: 18px; margin-left: 10px"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.mess != null}">
                <div class="alert alert-success" style="background-color: #d4edda; border-color: #c3e6cb; color: #155724;">
                    ${sessionScope.mess}
                    <% request.getSession().removeAttribute("mess"); %>
                </div>
            </c:if>
            <c:if test="${sessionScope.err != null}">
                <div class="alert alert-danger" role="alert" style="background-color: #f8d7da; border-color: #f5c6cb; color: #721c24;">
                    ${sessionScope.err}
                    <% request.getSession().removeAttribute("err"); %>
                </div>
            </c:if>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th class="text_page_head" scope="col">ID</th>
                                <th class="text_page_head" scope="col">Account</th>
                                <th class="text_page_head" scope="col">Full name</th>
                                <th class="text_page_head" scope="col">Status</th>
                                <th style="text-align: center;" class="text_page_head" scope="col">Actions</th> 
                            </tr>
                        </thead>
                        <tbody id="contentt">
                            <c:forEach items="${pagedMentors}" var="m">
                                <tr>
                                    <td class="text_page">${m.id}</td>
                                    <td class="text_page">${m.account.username}</td>
                                    <td class="text_page">${m.name}</td>
                                    <td class="text_page">${m.status ? 'Active' : 'Inactive'}</td>
                                    <td class="text_page" style="padding: 10px 2px 14px; text-align: center;">
                                            <a href="active_mentor?mid=${m.id}">
                                                <button type="button" class="btn btn-success">
                                                    Active
                                                </button>
                                            </a>
                                            <a href="inactive_mentor?mid=${m.id}">
                                                <button type="button" class="btn btn-danger">
                                                    Inactive
                                                </button>
                                            </a>
                                    </td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <myTag:myPagination currentPage="${page}" subject="mentors" totalPages="${num}"></myTag:myPagination>
                </div>
            </div>
        </div>
    </section>
</main>
        <script type="text/javascript">
        <% String message = (String)request.getSession().getAttribute("mess"); %>
        <% if(message != null && !message.isEmpty()) { %>
            alert("<%= message %>");
        <% request.getSession().removeAttribute("mess");
                } %>
    </script>

</body>
</html>
