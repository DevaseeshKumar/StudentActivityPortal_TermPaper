<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Include Chart.js -->
    <style>
        /* Success Popup Styling (white background with green text) */
        #loginSuccessPopup {
            display: none;
            background-color: white; /* White background */
            color: green; /* Green text for "Login Successful" */
            padding: 15px;
            text-align: center;
            position: fixed;
            top: 20px;
            right: 20px; /* Start at the top-right corner */
            z-index: 1000;
            border-radius: 5px;
            width: 250px; /* Set width for consistency */
            font-size: 16px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transform: translateX(100%); /* Initially off-screen */
            animation: slideIn 0.5s ease forwards; /* Animation for sliding */
        }

        /* Line under the popup that indicates time */
        #timeLine {
            height: 3px;
            background-color: green; /* Green line */
            width: 100%;
            margin-top: 10px;
            position: relative;
            animation: fillLine 3s linear forwards; /* Line filling animation */
        }

        /* Tick Symbol Style */
        #tickSymbol {
            color: green; /* Green tick symbol */
            font-size: 20px;
            display: inline-block; /* Display as inline-block so it can be animated */
            margin-right: 10px;
            opacity: 0; /* Hide initially */
            animation: showTick 0.5s forwards; /* Animation for showing the tick symbol */
        }

        /* Animation for the popup sliding in */
        @keyframes slideIn {
            0% {
                transform: translateX(100%); /* Start off-screen */
            }
            100% {
                transform: translateX(0); /* End at the correct position */
            }
        }

        /* Animation for showing the tick symbol */
        @keyframes showTick {
            0% {
                opacity: 0; /* Initially hidden */
            }
            100% {
                opacity: 1; /* Fade in */
            }
        }

        /* Animating the line filling */
        @keyframes fillLine {
            0% {
                width: 100%;
            }
            100% {
                width: 0%; /* Fill the line */
            }
        }

        /* Charts Styling - Reduced size */
        #countChart, #pieChart {
            max-width: 350px;  /* Reduced width */
            height: 300px;     /* Reduced height */
            margin: auto;
        }
        
        <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        margin-left: 200px; /* Offset content to account for the navbar */
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100vh; /* Full viewport height for vertical centering */
        background-color: #f5f5f5; /* Light background */
    }

    h2, h3 {
        text-align: center;
        margin: 10px 0;
    }

    #countChart, #pieChart {
        max-width: 300px;
        margin: 20px auto;
    }
</style>
        
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>

    <h2>Admin Dashboard</h2>

    <!-- Login Success Popup Message -->
    <div id="loginSuccessPopup">
        <span id="tickSymbol">&#10003;</span> <!-- Tick symbol (appears first) -->
        Login Successful
        <div id="timeLine"></div> <!-- Line under the popup -->
    </div>

    <!-- Charts Section -->
    <h3>Count</h3> <!-- Title above Bar Chart -->
    <canvas id="countChart"></canvas> <!-- Canvas for Bar Chart -->

    <h3>Distribution</h3> <!-- Title above Pie Chart -->
    <canvas id="pieChart"></canvas> <!-- Canvas for Pie Chart -->

    <script>
        // Get the values from the JSP page
        const facultyCount = ${fcount};
        const studentCount = ${scount};
        const eventCount = ${ecount};

        // Show the success popup if it's set
        window.onload = function() {
            const successMessage = '<%= session.getAttribute("successMessage") %>';
            if (successMessage) {
                const popup = document.getElementById("loginSuccessPopup");
                const timeLine = document.getElementById("timeLine");
                const tickSymbol = document.getElementById("tickSymbol");

                popup.style.display = "block"; // Show the popup

                // Animate the tick symbol first
                tickSymbol.style.animation = "showTick 0.5s forwards";

                // Animate the line filling after the tick symbol
                setTimeout(function() {
                    timeLine.style.animation = "fillLine 3s linear forwards"; 
                }, 500); // Wait for the tick animation to complete

                // Hide the popup after 3 seconds
                setTimeout(function() {
                    popup.style.display = "none"; // Hide the popup after 3 seconds
                }, 3500);

                <% session.removeAttribute("successMessage"); %> // Clear the message after displaying
            }

            // Initialize the Bar Chart
            new Chart(document.getElementById('countChart'), {
                type: 'bar',
                data: {
                    labels: ['Faculty', 'Students', 'Events'],
                    datasets: [{
                        data: [facultyCount, studentCount, eventCount],
                        backgroundColor: ['#4bc0c0', '#36a2eb', '#ffce56'],
                    }]
                },
                options: {
                    plugins: {
                        legend: { display: false }, // Hide the legend for simplicity
                        title: {
                            display: true,
                            text: 'Faculty, Student, and Event Counts' // Title for the Bar Chart
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: { stepSize: 1 }
                        }
                    }
                }
            });

            // Initialize the Pie Chart
            new Chart(document.getElementById('pieChart'), {
                type: 'pie',
                data: {
                    labels: ['Faculty', 'Students', 'Events'],
                    datasets: [{
                        data: [facultyCount, studentCount, eventCount],
                        backgroundColor: ['#4bc0c0', '#36a2eb', '#ffce56'],
                    }]
                },
                options: {
                    plugins: {
                        legend: { display: true }, // Display the legend for the pie chart
                        title: {
                            display: true,
                            text: 'Distribution of Faculty, Students, and Events' // Title for the Pie Chart
                        }
                    }
                }
            });
        };
    </script>

</body>
</html>
