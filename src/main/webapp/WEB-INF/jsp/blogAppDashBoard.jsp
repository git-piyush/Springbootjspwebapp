<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Colorful Dashboard</title>
    <style>
        body {
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #4f5b75;
            color: #ffffff;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar li {
            margin-bottom: 10px;
        }

        .sidebar a {
            color: #ffffff;
            text-decoration: none;
        }

        .sidebar a:hover {
            color: #e5e5e5;
        }

        .main-content {
            flex-grow: 1;
            background-color: #ffffff;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="settings.jsp">Settings</a></li>
                <li><a href="/getAllPost">ALL Posts</a></li>
                <li><a href="/createPostForm">Create Post</a></li>
                <li><a href="/searchPost">Search Post</a></li>
            </ul>
        </div>
        <div class="main-content">
            <!-- Main content area -->
        </div>
    </div>
</body>
</html>


