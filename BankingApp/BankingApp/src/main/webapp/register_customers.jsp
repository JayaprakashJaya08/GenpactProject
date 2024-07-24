<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration - Banking Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 110vh;
            margin: 0;
        }
        .registration-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h1 {
            margin-bottom: 1px;
            font-size: 24px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            text-align: left;
        }
        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="date"],
        select {
            width: 93%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h1>Customer Registration</h1>
        <form action="customer" method="post">
            <input type="hidden" name="action" value="registerCustomer"/>

            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required/>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required/>

            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" required/>

            <label for="emailId">Email ID:</label>
            <input type="email" id="emailId" name="emailId" required/>

            <label for="accountType">Type of Account:</label>
            <select id="accountType" name="accountType" required>
                <option value="Saving">Saving Account</option>
                <option value="Current">Current Account</option>
            </select>

            <label for="initialBalance">Initial Balance (min 1000):</label>
            <input type="number" id="initialBalance" name="initialBalance" min="1000" required/>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required/>

            <label for="idProof">ID Proof:</label>
            <input type="text" id="idProof" name="idProof" required/>

            <button type="submit">Register</button>
        </form>
        <a href="choose_role.jsp" class="back-link">Back to Choose Role</a>
    </div>
</body>
</html>