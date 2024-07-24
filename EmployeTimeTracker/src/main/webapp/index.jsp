<!DOCTYPE html>
<html>
<head>
    <title>Employee Time Tracker</title>
    <style>
        /* Reset some basic elements */
        body, h2, a {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            box-sizing: border-box;
        }

        /* Background and Layout */
        body {
            background: linear-gradient(135deg, #1c1c1c, #2e2e2e);
            color: #e0e0e0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            animation: backgroundAnim 15s ease infinite;
        }

        @keyframes backgroundAnim {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Header Styling */
        h2 {
            font-size: 36px;
            color: #00bfff;
            margin-bottom: 30px;
            text-align: center;
            animation: fadeIn 1s ease-in-out, shake 1s infinite;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            50% { transform: translateX(10px); }
            75% { transform: translateX(-10px); }
            100% { transform: translateX(0); }
        }

        /* Link Styling */
        a {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            color: #fff;
            background-color: #00bfff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 18px;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeInUp 1s ease-in-out, pulse 2s infinite;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 rgba(0, 191, 255, 0.5); }
            50% { box-shadow: 0 0 15px rgba(0, 191, 255, 0.9); }
            100% { box-shadow: 0 0 0 rgba(0, 191, 255, 0.5); }
        }

        /* Link Hover Effects */
        a:hover {
            background-color: #008fbf;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <h2>Welcome to Employee Time Tracker</h2>
    <a href="AdminLogin.jsp">Admin Login</a><br>
    <a href="AssociateLogin.jsp">Associate Login</a>
</body>
</html>
