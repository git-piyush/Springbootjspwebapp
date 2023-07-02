<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.blogApp.entity.Post" %>
<%@ page import="java.util.List" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <title>Post List</title>
    <style>
        .odd-row {
            background-color: lightblue;
        }
        .even-row {
            background-color: lightgray;
        }
        .highlight {
            font-weight: bold;
            color: red;
        }
        .container {
            
        }
        
        #cssTable td {
    text-align: center; 
    vertical-align: middle;
}
    </style>
</head>
<body>
<!-- Display the data -->
<h4>This is list of posts fetched by JPA findAll method</h4>
<table style="width:70%" id="cssTable" >
    <thead>
        <tr>
             <th><a href="?sortBy=id&amp;ascDir=${ascDir.equals('asc') ? 'desc' : 'asc'}">Title</a></th>
        	<th><a href="?sortBy=title&amp;ascDir=${ascDir.equals('asc') ? 'desc' : 'asc'}">Description</a></th>
            <th><a href="?sortField=name&amp;sortOrder=${yourData.sortOrder.equals('asc') ? 'desc' : 'asc'}">Content</a></th>
            <th colspan='2' >Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${allPost.content}" var="yourData">
            <tr>
                <td><a href="/getPost/${yourData.id}">${yourData.title}</a></td>
                <td>${yourData.description}</td>
                <td>${yourData.content}</td>
                <td>
                <button onclick="location.href='/getPost/${yourData.id}'" type="button">Edit</button>
        	    <button onclick="location.href='/deletePost/${yourData.id}'" type="button">Delete</button>               	
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Display pagination links -->
<div>
    <c:if test="${allPost.totalPages > 1}">
        <c:choose>
            <c:when test="${allPost.number > 0}">
                <a href="?pageNo=${allPost.number - 1}&amp;pageSize=${allPost.size}">Previous</a>
            </c:when>
            <c:otherwise>
                <span>Previous</span>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="0" end="${allPost.totalPages - 1}" var="i">
            <c:choose>
                <c:when test="${allPost.number == i}">
                    <span>${i + 1}</span>
                </c:when>
                <c:otherwise>
                    <a href="?pageNo=${i}&amp;pageSize=${allPost.size}">${i + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${allPost.number < allPost.totalPages - 1}">
                <a href="?pageNo=${allPost.number + 1}&amp;pageSize=${allPost.size}">Next</a>
            </c:when>
            <c:otherwise>
                <span>Next</span>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>
<div class="container">
        <button onclick="location.href='/blogAppDashBoard'" type="button">
         Blog App DashBoard</button>
    </div>
</body>
</html>



