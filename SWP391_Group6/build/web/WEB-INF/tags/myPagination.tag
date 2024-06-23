<%-- 
    Document   : myPagination
    Created on : Jun 1, 2024, 4:50:15 PM
    Author     : Admin
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@ attribute name="subject" required="true" type="java.lang.String" %>
<%@ attribute name="currentPage" required="true" type="java.lang.Integer" %>
<%@ attribute name="totalPages" required="true" type="java.lang.Integer" %>
<%@ attribute name="appendQueryString" required="false" type="java.lang.String" %>
<%-- any content can be specified here e.g.: --%>
<h2>${message}</h2>
<style>

</style>

<div class="clearfix" style="text-align: center; margin: auto 0">
    <c:set var="currentPage" value="${currentPage}" />
    <c:set var="totalPages" value="${totalPages}" />
    <c:set var="maxPagesToShow" value="2" />
    <c:choose>
        <c:when test="${currentPage + maxPagesToShow > totalPages}">
            <c:set var="endPage" value="${totalPages}" />
        </c:when>
        <c:otherwise>
            <c:set var="endPage" value="${currentPage + maxPagesToShow}" />
        </c:otherwise>
    </c:choose>


    <ul class="pagination" style="padding-left: 420px;">
        <c:if test="${currentPage != 1}">
            <li class="page-item">
                <a class="page-link" href="${subject}?page=1${appendQueryString}">First</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="${subject}?page=${currentPage-1}${appendQueryString}">Previous</a>
            </li>
        </c:if>
            

        <c:forEach begin="${currentPage}" end="${endPage}" var="i">
            <li class="page-item">
                <a class="${currentPage == i ? 'page-link activee' : 'page-link'}" href="${subject}?page=${i}${appendQueryString}">
                    ${i}
                </a>
            </li>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <a class="page-link" href="${subject}?page=${currentPage+1}${appendQueryString}">Next</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="${subject}?page=${totalPages}${appendQueryString}">Last</a>
            </li>
        </c:if>
    </ul>
</div>