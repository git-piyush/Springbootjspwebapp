<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <style>
        body {
            background-color: #f1f1f1;
            font-family: Arial, sans-serif;
        }
        
        .container {
            width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        h1 {
            color: #FF4081;
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        p {
            color: #757575;
            font-size: 18px;
        }
        
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #FF4081;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s;
        }
        
        .button:hover {
            background-color: #D50062;
        }
    </style>
    <script>
        function ready() {
            // Code to be executed when the page finishes loading
            console.log("Page is ready!");
            // Add your own custom JavaScript code here
        }
        
        // Call the ready function when the page finishes loading
        window.onload = ready;
    </script>
</head>

<body>
    <div class="container">
        <h1>Welcome to our Colorful Website!</h1>
        <p>Thank you for visiting. We hope you enjoy your stay.</p>
        <a href="/blogAppDashBoard" class="button">Blog App DashBoard</a>
    </div>
</body>
</html>
