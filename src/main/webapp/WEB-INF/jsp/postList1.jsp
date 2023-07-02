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
    <title>PostList</title>
    <style>

/* Styles for the form container */
        .form-container {
            margin: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Styles for the toggle button */
        .toggle-button {
            margin-bottom: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        /* Styles for the form fields */
        .form-fields {
            display: none;
        }

        .form-fields input[type="text"],
        .form-fields textarea {
            
        }

        .form-fields button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-fields button[type="submit"]:hover {
            background-color: #45a049;
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
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
    </style>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".toggle-button").click(function() {
                $(".form-fields").slideToggle();
            });
        });
    </script>
</head>
<body>

<h1>This is List of posts fetched by hql query </h1>

   <div class="form-container">
        <div class="form-fields">
            <form method="post" action="/loadPostList">
                <label for="name">Title:</label>
                <input type="text" id="title" name="title">

                <label for="email">Description:</label>
                <input type="text" id="description" name="description" >

                <label for="message">Content:</label>
                <input type="text" id="content" name="content"></input>

                <button type="submit">Submit</button>
            </form>
        </div>
        <div class="toggle-button">Enter Search Details</div>
    </div>


<!-- Display the data -->
<table style="width:70%" id="posts" >
    <thead>
        <tr>
            <th>Title</th>
        	<th>Description</th>
            <th>Content</th>
            <th colspan='2' >Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${allPost}" var="yourData">
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
<div class="container">
        <button onclick="location.href='/blogAppDashBoard'" type="button">
         Blog App DashBoard</button>
    </div>
</body>
</html>



