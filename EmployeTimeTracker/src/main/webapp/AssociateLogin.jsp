<!DOCTYPE html>
<html>
<head>
    <title>Associate Login</title>
    <style>
        /* Reset some basic elements */
        body, h2, input {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #141e30, #243b55);
            color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            animation: backgroundAnim 10s ease infinite;
        }

        @keyframes backgroundAnim {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h2 {
            font-size: 32px;
            color: #00bfff;
            margin-bottom: 20px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        form {
            background-color: rgba(34, 34, 34, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeInUp 1.5s ease-in-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 24px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #00bfff;
            border-radius: 5px;
            background-color: #1e2a38;
            color: #e0e0e0;
            font-size: 16px;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #00aaff;
            background-color: #2a3b4c;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background-color: #00bfff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        input[type="submit"]:hover {
            background-color: #008fbf;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <h2>Associate Login</h2>
    <form action="AssociateLoginServlet" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
