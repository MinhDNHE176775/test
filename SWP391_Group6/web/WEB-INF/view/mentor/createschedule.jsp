<%-- 
    Document   : createschedule
    Created on : Jun 3, 2024, 9:04:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="myTag" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>StudyLab - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">


        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

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

            table {
                width: 95%;
                border-collapse: collapse;
                margin-top: 20px;
                margin-left: 30px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
                background-color: #fff;
            }

            th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            td {
                background-color: #fff;
            }

        </style>
    </head>

    <body>
        <jsp:include page="../component/header.jsp"/>
        <section class="ftco-section bg-light">
            <p class="text-center" style="color: red">${sessionScope.err}</p>
            <% request.getSession().removeAttribute("err"); %>
            <p class="text-center" style="color: green">${sessionScope.success}</p>
            <% request.getSession().removeAttribute("success"); %>
            <p class="text-center" style="color: red">${requestScope.dateErr}</p>

            <p class="ml-5" style="font-style: italic">Please choose your free session in the checkbox below. You can change week in the select option</p>
            <h1 style=" font-family: Arial, Helvetica, sans-serif" class="text-center">Create Free Session</h1>
            <div class="selectyear">
                <p class="text-center">Year: ${sessionScope.year}</p>
            </div>
            <form id="timetableForm" action="schedule" method="post">
                <input type="hidden" name="menid" value="${requestScope.mentor.id}"/>
                <input type="hidden" name="scheduleDate" id="schedate"/>
                <input type="hidden" name="freeSlot" id="slotid"/>
                <input type="hidden" name="action" id="action"/>
                <input type="hidden" name="sesid" id="sesid"/>
                <input type="hidden" name="changeweek" id="changeweek"/>
                <input type="hidden" name="timeFromSlot" id="timeFromSlot"/>
                <div id="scheduleTable">
                    <table class="table-bordered">
                        <tr>
                            <td style="background-color: #00BFFF">
                                Select week:
                                <select name="weeks">
                                    <c:set var="weekField" value="1"/>
                                    <c:forEach var="entry" items="${sessionScope.weeks_on_year}">
                                        <c:set var="key" value="${entry.key}"/>
                                        <c:set var="value" value="${entry.value}"/>                                                      
                                        <option value="${key} ${value}" <c:if test="${(requestScope.currentWeek eq weekField) or (requestScope.changeWeek eq weekField)}">selected</c:if> 
                                                >
                                            ${key.toString().split("-")[2]}-${key.toString().split("-")[1]} 
                                            to ${value.toString().split("-")[2]}-${value.toString().split("-")[1]}

                                        </option>
                                        <c:set var="weekField" value="${weekField + 1}"/>
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #00BFFF">Mon<br>${sessionScope.dates[0].toString().split("-")[2]}-${sessionScope.dates[0].toString().split("-")[1]}</td>
                            <td style="text-align: center;background-color: #00BFFF">Tue<br>${sessionScope.dates[1].toString().split("-")[2]}-${sessionScope.dates[1].toString().split("-")[1]}</td>
                            <td style="text-align: center;background-color: #00BFFF">Wed<br>${sessionScope.dates[2].toString().split("-")[2]}-${sessionScope.dates[2].toString().split("-")[1]}</td>
                            <td style="text-align: center;background-color: #00BFFF">Ths<br>${sessionScope.dates[3].toString().split("-")[2]}-${sessionScope.dates[3].toString().split("-")[1]}</td>
                            <td style="text-align: center;background-color: #00BFFF">Fri<br>${sessionScope.dates[4].toString().split("-")[2]}-${sessionScope.dates[4].toString().split("-")[1]}</td>
                            <td style="text-align: center;background-color: #00BFFF">Sat<br>${sessionScope.dates[5].toString().split("-")[2]}-${sessionScope.dates[5].toString().split("-")[1]}</td>
                            <td style="text-align: center;background-color: #00BFFF">Sun<br>${sessionScope.dates[6].toString().split("-")[2]}-${sessionScope.dates[6].toString().split("-")[1]}</td>
                        </tr>
                        <c:forEach items="${sessionScope.slots}" var="r">
                            <tr>
                                <td>Slot ${r.id}(${r.from}-${r.to})</td>
                                <c:forEach var="d" items="${sessionScope.dates}">
                                    <td>
                                        <input type="checkbox" name="datePicked" value="${d} ${r.from} ${r.id}">
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-primary mt-3 mr-3" onclick="submitll()">Submit</button>
                        <button type="button" class="btn bg-light border-black mt-3">
                            Save draft
                        </button> 
                    </div>
                </div>
            </form>
        </section>

        <jsp:include page="../component/footer.jsp"/>


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
        <script src="${pageContext.request.contextPath}/resources/js/date.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
        <script>
                            var checkBoxes = {};
                            $(document).ready(function () {
                                $('#scheduleTable').on('change', 'select[name="weeks"]', function () {
                                    storeCheckboxes();
                                    var selectedWeek = $(this).val();
                                    var form = $('#timetableForm');
                                    var formData = form.serialize();
                                    $.ajax({
                                        url: "schedule?changeweek=change",
                                        type: 'post',
                                        data: formData,
                                        success: function (response) {
                                            var slots = response.slots;
                                            var dates = response.dates;
                                            var changeWeek = response.changeWeek;
                                            var weeksOnYear = response.weeks_on_year;
                                            $("#scheduleTable").html('');
                                            var tableHtml = '<table class="table-bordered">';
                                            tableHtml += `<input type="hidden" name="menid" value="${sessionScope.mentor.id}"/>`;
                                            tableHtml += '<input type="hidden" name="scheduleDate" id="schedate"/>';
                                            tableHtml += `<tr>
                                                                    <td style="background-color: #00BFFF">
                                                                     Select week:
                                                                `;
                                            tableHtml += '<select name="weeks">';
                                            var weekField = 1;
                                            $.each(weeksOnYear, function (index, week) {
                                                let weeks = week.week.split(",");
                                                tableHtml += ' <option value="' + weeks[0] + ' ' + weeks[1] + '"';
                                                if (weekField === changeWeek) {
                                                    tableHtml += ' selected';
                                                }
                                                weekField++;
                                                tableHtml += '>';
                                                tableHtml += '' + week.week.split(",")[0].split("-")[2] + '-' + week.week.split(",")[0].split("-")[1] + ' to ' + week.week.split(",")[1].split("-")[2] + '-' + week.week.split(",")[1].split("-")[1] + '';
                                                tableHtml += '</option>';
                                            });
                                            tableHtml += '</select>';
                                            tableHtml += '</td>';
                                            tableHtml += `
                                                                                 <td style="text-align: center; background-color: #00BFFF">Mon<br>` + dates[0].date.split("-")[2] + `-` + dates[0].date.split("-")[1] + `</td>
                            <td style="text-align: center;background-color: #00BFFF">Tue<br>` + dates[1].date.split("-")[2] + `-` + dates[1].date.split("-")[1] + `</td>
                            <td style="text-align: center;background-color: #00BFFF">Wed<br>` + dates[2].date.split("-")[2] + `-` + dates[2].date.split("-")[1] + `</td>
                            <td style="text-align: center;background-color: #00BFFF">Ths<br>` + dates[3].date.split("-")[2] + `-` + dates[3].date.split("-")[1] + `</td>
                            <td style="text-align: center;background-color: #00BFFF">Fri<br>` + dates[4].date.split("-")[2] + `-` + dates[4].date.split("-")[1] + `</td>
                            <td style="text-align: center;background-color: #00BFFF">Sat<br>` + dates[5].date.split("-")[2] + `-` + dates[5].date.split("-")[1] + `</td>
                            <td style="text-align: center;background-color: #00BFFF">Sun<br>` + dates[6].date.split("-")[2] + `-` + dates[6].date.split("-")[1] + `</td>
                                                                              `;
                                            tableHtml += '</tr>';
                                            $.each(slots, function (index, slot) {
                                                tableHtml += '<tr>';
                                                tableHtml += '<td>Slot ' + slot.slot.id + '</td>';
                                                $.each(dates, function (index, date) {
                                                    tableHtml += '<td>';
                                                    var date1 = new Date(date.date);
                                                    var currDate = new Date();
                                                    if (date1.getTime() > currDate.getTime()) {
                                                        var sessionExist = false;
                                                        $.each(response.sessions, function (index, s) {
                                                            var formattedDate = convertDateFormat(s.session.date);
                                                            if (formattedDate === date.date && s.session.slot.id === slot.slot.id) {
                                                                sessionExist = true;
                                                            }
                                                        });
                                                        if (!sessionExist) {
                                                            tableHtml += '<input type="checkbox" name="datePicked" value="' + date.date + ' ' + slot.slot.from + ' ' + slot.slot.id + '"/>';
                                                        }
                                                    }
                                                    tableHtml += '</td>';
                                                });
                                                tableHtml += '</tr>';
                                            });
                                            tableHtml += '</table>';
                                            tableHtml += `<div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-primary mt-3 mr-3" onclick="submitll()">Submit</button>
                        <button type="button" class="btn bg-light border-black mt-3">
                            Save draft
                        </button> 
                    </div> `;
                                            $("#scheduleTable").html(tableHtml);
                                            restoreCheckboxState();
                                        }, error: function (error) {
                                            console.error('AJAX request failed:', error);
                                            alert("sjdjds");
                                        }
                                    });
                                });
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

                            $('input[name="datePicked"]').on('click', function () {
                                var key = $(this).val();
                                var currDate = new Date();
                                var keyArr = key.split(" ");
                                var checkDate = new Date(keyArr[0] + ' ' + keyArr[1]);
                                if (checkDate.getTime() - currDate.getTime() < 100000000) {
                                    alert("ban nhu cut");
                                    $(this).prop('checked', false);
                                } else {
                                    checkBoxes[key] = $(this).is(':checked');
                                }
                            });

                            function storeCheckboxes() {
                                $('input[name="datePicked"]').each(function () {
                                    var key = $(this).val();
                                    if ($(this).is(':checked')) {
                                        checkBoxes[key] = true;
                                    } else {
                                        delete checkBoxes[key];
                                    }
                                });
                            }

                            function restoreCheckboxState() {
                                $('input[name="datePicked"]').each(function () {
                                    var key = $(this).val();
                                    if (checkBoxes.hasOwnProperty(key)) {
                                        $(this).prop('checked', checkBoxes[key]);
                                    }
                                });
                            }

                            function submitll() {
                                storeCheckboxes();
                                var value = "";
                                $.each(Object.keys(checkBoxes), function (index, key) {
                                    var keyss = key.split(" ");
                                    var formattedTime = convertTo24Hour(keyss[1] + ' ' + keyss[2]);
                                    value += keyss[0] + ' ' + formattedTime + ' ' + keyss[3] + ",";
                                });
                                $("#action").val("Submit");
                                $("#schedate").val(value);
                                $("#timetableForm").submit();
                            }
        </script>

    </body>
</html>

