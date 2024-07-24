<!DOCTYPE html>
<html>
<head>
    <title>View Reports</title>
    <style>
        /* Reset some basic elements */
        body, h1, form, label, input, button {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            box-sizing: border-box;
        }

        /* Page Background and Layout */
        body {
            background: linear-gradient(135deg, #1e1e1e, #2b2b2b);
            color: #e0e0e0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            animation: backgroundAnim 20s linear infinite;
        }

        @keyframes backgroundAnim {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Header Styling */
        h1 {
            font-size: 36px;
            color: #00bfff;
            margin-bottom: 20px;
            text-align: center;
            animation: fadeIn 1s ease-in-out, bounce 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* Form Styling */
        form {
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: slideIn 1s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        label {
            font-size: 18px;
            color: #ddd;
            margin-bottom: 10px;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #555;
            border-radius: 5px;
            font-size: 16px;
            color: #333;
            background-color: #444;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        input[type="number"]:focus {
            border-color: #00bfff;
            background-color: #555;
            outline: none;
        }

        button {
            padding: 10px 20px;
            background-color: #00bfff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 rgba(0, 191, 255, 0.5); }
            50% { box-shadow: 0 0 15px rgba(0, 191, 255, 0.9); }
            100% { box-shadow: 0 0 0 rgba(0, 191, 255, 0.5); }
        }

        button:hover {
            background-color: #008fbf;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Chart Containers */
        #piechart, #weeklychart, #monthlychart {
            width: 100%;
            max-width: 900px;
            height: 500px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            animation: fadeInUp 1s ease-in-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            const userId = document.getElementById("userId").value;
            drawPieChart(userId);
            drawWeeklyChart(userId);
            drawMonthlyChart(userId);
        }

        function drawPieChart(userId) {
            fetch('chartData2?type=pie&userid=' + userId, { credentials: 'include' })
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

        function drawWeeklyChart(userId) {
            fetch('chartData2?type=weekly&userid=' + userId, { credentials: 'include' })
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

        function drawMonthlyChart(userId) {
            fetch('chartData2?type=monthly&userid=' + userId, { credentials: 'include' })
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
    <form onsubmit="event.preventDefault(); drawChart();">
        <label for="userId">User ID:</label>
        <input type="number" id="userId" name="userId" required>
        <button type="submit">View Reports</button>
    </form>
    <div id="piechart"></div>
    <div id="weeklychart"></div>
    <div id="monthlychart"></div>
</body>
</html>
