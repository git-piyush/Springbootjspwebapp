<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.blogApp.entity.Post" %>
<%@ page import="java.util.List" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
             padding-top: 25px;
        }
        
        #cssTable td {
    text-align: center; 
    vertical-align: middle;
}
        #posts {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#posts td, #posts th {
  border: 1px solid #ddd;
  padding: 8px;
}

#posts tr:nth-child(even){background-color: #f2f2f2;}

#posts tr:hover {background-color: #ddd;}

#posts th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #36454F;
  color: white;
}
</style>

<script>
function myfunction(id) {   
	if (confirm("Are you sure to delete this Post?")) {
	    ajaxCall(id);
	  }else{
		  return;
		  }
	     }
function ajaxCall(id) {
	alert(window.location.hostname);
	alert(window.location.port);
	var url = window.location.hostname+":"+window.location.port+"/deletePost/"+id;
	alert(url);
    $.ajax({
        url:window.location.hostname+":"+window.location.port+"/deletePost/"+id,

        // Type of Request
        type: 'DELETE',

        // Function to call when to
        // request is ok
        success: function (data) {
            var x = JSON.stringify(data);
            console.log(x);
        },

        // Error handling
        error: function (error) {
            console.log(`Error ${error}`);
        }
    });
}	     
</script>


</head>
<body>
<marquee width="60%" direction="left" height="40px">This is a Springboot Web application.</marquee>
<h4>This is list of posts fetched by JPA findAll method</h4>
<table style="width:70%" id="posts" >
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
                <td align="center">
                <button onclick="location.href='/getPost/${yourData.id}'" type="button" class="btn btn-primary" >Edit</button>
        	    <button onclick="location.href='/deletePost/${yourData.id}'" type="button" class="btn btn-danger">Delete</button> 
        	    <button type="button" class="btn btn-danger" onclick = "myfunction(${yourData.id})">Delete</button>              	
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
        <button onclick="location.href='/blogAppDashBoard'" type="button" class="btn btn-secondary">
         Blog App DashBoard</button>
    </div>
</body>
</html>



