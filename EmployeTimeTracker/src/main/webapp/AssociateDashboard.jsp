<!DOCTYPE html>
<html>
<head>
    <title>Associate Dashboard</title>
    <style>
        /* Reset some basic elements */
        body, h2, a {
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

        .container {
            width: 80%;
            max-width: 1000px;
            padding: 30px;
            background-color: rgba(34, 34, 34, 0.9);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            margin-bottom: 20px;
            font-size: 32px;
            color: #00bfff;
            border-bottom: 2px solid #00bfff;
            display: inline-block;
            padding-bottom: 5px;
            animation: slideIn 1s ease-in-out;
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .nav-links {
            margin-bottom: 20px;
        }

        .nav-links a {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            color: #fff;
            background-color: #00bfff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            animation: fadeInUp 1s ease-in-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .nav-links a:hover {
            background-color: #008fbf;
            transform: translateY(-2px);
        }

        .logout {
            margin-top: 20px;
        }

        .logout a {
            display: inline-block;
            padding: 12px 25px;
            color: #fff;
            background-color: #ff3333;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            animation: fadeInUp 1s ease-in-out;
            animation-delay: 0.2s;
        }

        .logout a:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Associate Dashboard</h2>
        <div class="nav-links">
            <a href="work.jsp">Task Management</a>
            <a href="viewReportsAssociate.jsp">View Reports</a>
            <!-- Add more associate-specific functionalities here -->
        </div>
        <div class="logout">
            <a href="index.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
