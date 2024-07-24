<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application - Choose Role</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f06, #4a90e2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 2em;
            color: #4a90e2;
        }
        p {
            margin-bottom: 30px;
            font-size: 1.1em;
        }
        .btn {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px 0;
            color: #fff;
            background: linear-gradient(135deg, #4a90e2, #007bff);
            border: none;
            border-radius: 50px;
            text-decoration: none;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn:hover {
            background: linear-gradient(135deg, #007bff, #4a90e2);
            transform: scale(1.05);
        }
        .btn:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Our Bank</h1>
        <p>Select your role to proceed</p>
        <a href="admin_login.jsp" class="btn">Admin Login</a>
        <a href="customer_login.jsp" class="btn">Customer Login</a>
    </div>
</body>
</html>
