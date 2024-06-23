<%-- 
    Document   : updateskill
    Created on : Jun 3, 2024, 12:09:26 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Skill</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            img {
                width: 200px;
                height: 120px;
            }

            select {
                width: 32.3%;
                margin: 0;
                font-size: 100%;
                padding: 5px 10px 5px 10px;
                font-family: Segoe UI, Helvetica, sans-serif;
                border: 1px solid #D0D0D0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                border-radius: 20px;
                outline: none;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit Skill</h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editSkillModal">
                <div class="modal-dialog" style="width: 100%">
                    <div class="modal-content">
                        <form id="form" action="updateskill" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Skill</h4>
                                <a href="skills">
                                    <button style="position: absolute; right: 20px; top: 20px; color: black" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                                </a>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label> 
                                    <input value="${detail.id}" name="id" type="text" class="form-control" readonly required>
                                </div> 
                                <div class="form-group">
                                    <label>Skill Name</label>
                                    <input value="${detail.skillname}" name="skillname" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <input type="checkbox" name="status" ${detail.status ? 'checked' : ''} value="true">
                                </div>
                                <div class="form-group" style="display: flex; align-items: center; justify-content: space-between">
                                    <label style="margin-right: 20px">Image</label>
                                    <div>
                                        <c:forEach var="img" items="${detail.ava}">
                                            <img style="width: 200px; height: auto; margin-right: 10px;" src="assets/uploads/skill/${img}">
                                        </c:forEach>
                                    </div>
                                    <input id="imageInput" name="image" type="file" accept=".jpg, .jpeg, .png">
                                    <input type="hidden" name="image-initiate" value="${detail.ava}">
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea style="height: 200px" name="description" class="form-control" required>${detail.description}</textarea>
                                </div>
                            </div>
                            <input type="hidden" name="jj" value="klk">
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/resources/js/main_2.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/clickevents.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/calender.js"></script>

    </body>
</html>
