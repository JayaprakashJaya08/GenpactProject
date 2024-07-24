<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #282c34; /* Dark background color */
            color: #61dafb; /* Light text color */
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #1c1e22; /* Darker container background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: 20px auto;
        }
        h1 {
            color: #61dafb; /* Light blue header color */
            margin-bottom: 20px;
            text-align: center;
        }
        .dashboard-link {
            display: block;
            margin-bottom: 15px;
            padding: 12px;
            text-decoration: none;
            background-color: #61dafb; /* Light blue link background color */
            color: #1c1e22; /* Dark text color for contrast */
            border-radius: 8px;
            text-align: center;
            transition: background-color 0.3s, transform 0.3s;
        }
        .dashboard-link:hover {
            background-color: #21a1f1; /* Darkened hover color */
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
        form {
            text-align: center;
            margin-top: 30px;
        }
        form input[type="submit"] {
            background-color: #61dafb; /* Light blue logout button color */
            color: #1c1e22; /* Dark text color for contrast */
            padding: 12px 25px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
        }
        form input[type="submit"]:hover {
            background-color: #21a1f1; /* Darkened hover color */
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Your Dashboard</h1>
        <a href="ViewBalanceServlet" class="dashboard-link">View Balance</a>
        <a href="ViewTransactionsServlet" class="dashboard-link">View Transactions</a>
        <a href="WithdrawServlet" class="dashboard-link">Withdraw Money</a>
        <a href="DepositServlet" class="dashboard-link">Deposit Money</a>
        <a href="delete_account.jsp" class="dashboard-link">Delete Account</a>
        <form action="customer_login.jsp">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
