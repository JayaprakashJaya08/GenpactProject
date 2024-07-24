<%@ page import="javax.servlet.http.*, java.sql.*, java.util.*" %>
<%
    if (session == null || session.getAttribute("userid") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Reports</title>
    <style>
        /* Reset some basic elements */
        body, h1, div {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            box-sizing: border-box;
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
            overflow: hidden;
        }

        /* Header Styling */
        h1 {
            font-size: 36px;
            color: #00bfff;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Chart Containers */
        #piechart, #weeklychart, #monthlychart {
            width: 100%;
            max-width: 900px;
            height: 500px;
            margin-bottom: 20px;
            border-radius: 10px;
            background-color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        /* Responsive Design for Smaller Screens */
        @media (max-width: 960px) {
            #piechart, #weeklychart, #monthlychart {
                width: 100%;
                height: 400px;
            }
        }

        @media (max-width: 600px) {
            #piechart, #weeklychart, #monthlychart {
                width: 100%;
                height: 300px;
            }
        }
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            drawPieChart();
            drawWeeklyChart();
            drawMonthlyChart();
        }

        function drawPieChart() {
            fetch('chartData?type=pie', { credentials: 'include' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    var dataTable = google.visualization.arrayToDataTable([
                        ['Task', 'Total Time'],
                        ...data
                    ]);

                    var options = { title: 'Tasks Breakdown' };
                    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                    chart.draw(dataTable, options);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }

        function drawWeeklyChart() {
            fetch('chartData?type=weekly', { credentials: 'include' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    var dataTable = google.visualization.arrayToDataTable([
                        ['Week', 'Total Time'],
                        ...data
                    ]);

                    var options = { title: 'Weekly Work Analysis' };
                    var chart = new google.visualization.ColumnChart(document.getElementById('weeklychart'));
                    chart.draw(dataTable, options);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }

        function drawMonthlyChart() {
            fetch('chartData?type=monthly', { credentials: 'include' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    var dataTable = google.visualization.arrayToDataTable([
                        ['Month', 'Total Time'],
                        ...data
                    ]);

                    var options = { title: 'Monthly Work Analysis' };
                    var chart = new google.visualization.ColumnChart(document.getElementById('monthlychart'));
                    chart.draw(dataTable, options);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }
    </script>
</head>
<body>
    <h1>Work Analysis Reports</h1>
    <div id="piechart"></div>
    <div id="weeklychart"></div>
    <div id="monthlychart"></div>
</body>
</html>
