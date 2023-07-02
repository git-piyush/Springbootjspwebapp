<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post</title>
    <style>
        body {
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #4f5b75;
        }

        .form-container {
            width: 400px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
        }

        .form-container label {
            display: block;
            margin-bottom: 10px;
            color: #4f5b75;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #e5e5e5;
            border-radius: 3px;
        }

        .form-container input[type="submit"] {
            background-color: #4f5b75;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #35405e;
        }
    </style>
</head>
<body>
    <div class="form-container">
       <div>
        <button onclick="location.href='/blogAppDashBoard'" type="button">
         Blog App DashBoard</button>
    </div>
        <h2>Create Post</h2>
        <form action="/createPost" method="post">
        	
            <div style="display: none">
            	<input type="number" id="id" name="id" value ="${post.id}" ></input>
            </div>
        
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value = "${post.title}" required>
            
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" value="${post.description}" required>
            
            <label for="content">Content:</label><br>
            <textarea placeholder="Enter some content." id="content" name="content" rows="5" cols="40" value="">${post.content}</textarea>
            
            <input type="submit" value="Save">
        </form>
    </div>
</body>
</html>

