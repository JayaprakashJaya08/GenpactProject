<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page session="true" %>
<%
    if (session == null || session.getAttribute("userid") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Long startTime = (Long) session.getAttribute("startTime");
    Long currentTime = System.currentTimeMillis();
    Long elapsedTime = startTime != null ? currentTime - startTime : 0L;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Work Tracker</title>
    <style>
        /* Reset basic elements */
        body, h2, form, select, button, div {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Page Background and Layout */
        body {
            background: linear-gradient(135deg, #2b2b2b, #1e1e1e);
            color: #e0e0e0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 80%;
            max-width: 600px;
            text-align: center;
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        h2 {
            margin-top: 20px;
            color: #00bfff;
            font-size: 36px;
        }

        select, button {
            width: calc(100% - 40px);
            max-width: 300px;
            padding: 10px;
            margin: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        select {
            background-color: #444;
            color: #ddd;
        }

        button {
            background-color: #00bfff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        button:hover {
            background-color: #008fbf;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        #timer {
            font-size: 24px;
            margin: 20px;
            color: #ddd;
        }

        @media (max-width: 600px) {
            .container {
                width: 90%;
            }

            select, button {
                width: calc(100% - 20px);
                margin: 10px 10px;
            }

            h2 {
                font-size: 28px;
            }

            #timer {
                font-size: 20px;
            }
        }
    </style>
    <script>
        var timer;
        var startTime = <%= startTime != null ? startTime : "null" %>;
        var elapsedTime = <%= elapsedTime %>;

        function startTimer() {
            if (!startTime) {
                startTime = new Date().getTime();
                elapsedTime = 0;
                <% session.setAttribute("startTime", new java.util.Date().getTime()); %>
            }
            timer = setInterval(updateTimer, 1000);
            document.getElementById("startButton").disabled = true;
            document.getElementById("stopButton").disabled = false;
        }

        function updateTimer() {
            var currentTime = new Date().getTime();
            var totalElapsedTime = currentTime - startTime + elapsedTime;
            var seconds = Math.floor((totalElapsedTime / 1000) % 60);
            var minutes = Math.floor((totalElapsedTime / (1000 * 60)) % 60);
            var hours = Math.floor((totalElapsedTime / (1000 * 60 * 60)) % 24);

            document.getElementById("timer").innerHTML = 
                (hours < 10 ? "0" + hours : hours) + ":" +
                (minutes < 10 ? "0" + minutes : minutes) + ":" +
                (seconds < 10 ? "0" + seconds : seconds);
        }

        function stopTimer() {
            clearInterval(timer);
            document.getElementById("endTime").value = new Date().getTime();
            document.getElementById("workForm").submit();
        }
    </script>
</head>
<body onload="if (startTime) startTimer()">
    <div class="container">
        <h2>Work Tracker</h2>
        <form id="workForm" action="AssociateWorkServlet" method="post">
            <input type="hidden" name="startTime" value="<%= session.getAttribute("startTime") != null ? session.getAttribute("startTime") : new java.util.Date().getTime() %>">
            <input type="hidden" id="endTime" name="endTime" value="">
            <select name="taskId" required>
                <option value="" disabled selected>Select a Task</option>
                <% 
                    // Retrieve tasks from the database
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeTimeTracker", "root", "root");
                        ps = con.prepareStatement("SELECT id, taskName FROM tasksManagement");
                        rs = ps.executeQuery();
                        while(rs.next()) {
                %>
                            <option value="<%= rs.getInt("id") %>"><%= rs.getString("taskName") %></option>
                <%
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if(rs != null) rs.close();
                            if(ps != null) ps.close();
                            if(con != null) con.close();
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>
            <br>
            <button type="button" id="startButton" onclick="startTimer()">Start</button>
            <button type="button" id="stopButton" onclick="stopTimer()" disabled>Stop</button>
        </form>
        <div id="timer">00:00:00</div>
    </div>
</body>
</html>
