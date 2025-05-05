<%@ page import="com.klef.jfsd.sdp.model.Faculty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) {
    response.sendRedirect("facsessionfail"); // Redirect to session fail page if faculty is not in session
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Home</title>
    <style>
        /* Popup styling */
        #loginSuccessPopup {
            display: none;
            background-color: white;
            color: green;
            padding: 10px;
            text-align: left;
            position: fixed;
            top: 20px;
            right: -300px; /* Start the popup off-screen */
            z-index: 1000;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.5s forwards; /* Slide-in animation */
            width: 300px;
        }

        /* Green line under the popup */
        #greenLine {
            height: 4px;
            background-color: green;
            width: 0%; /* Start the width at 0% */
            animation: slideLine 1.5s forwards; /* Slide the line from right to left */
            margin-top: 5px; /* Space between text and line */
        }

        /* Keyframe animation for sliding in from the right */
        @keyframes slideIn {
            0% {
                right: -300px; /* Start off-screen */
            }
            100% {
                right: 20px; /* End at 20px from the right edge */
            }
        }

        /* Keyframe animation for the green line sliding */
        @keyframes slideLine {
            0% {
                width: 100%; /* Start with no width */
            }
            100% {
                width: 0%; /* End with full width */
            }
        }

        /* Tick icon styling */
        .tick-icon {
            width: 18px;
            height: 18px;
            margin-right: 10px;
            vertical-align: middle;
            fill: green;
        }

        /* Cancel button styling */
        .cancel-btn {
            background: none;
            border: none;
            color: green;
            font-size: 18px;
            font-weight: bold;
            position: absolute;
            top: 5px;
            right: 5px;
            cursor: pointer;
        }

        /* Center content */
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
            text-align: center;
        }

        h2 {
            margin: 0;
            font-size: 2em;
        }

        .welcome-message {
            font-size: 1.5em;
            margin-top: 10px;
        }

        /* Optional: Style for the page background */
        body {
            background-color: #f4f7fa; /* Light background color */
            font-family: Arial, sans-serif; /* Font style */
            margin: 0;
            padding: 0;
        }
    </style>
    <script>
        window.onload = function() {
            const successMessage = '<%= session.getAttribute("successMessage") %>';
            if (successMessage) {
                const popup = document.getElementById("loginSuccessPopup");
                popup.style.display = "block"; // Show the popup

                // Hide the popup after 3 seconds
                setTimeout(function() {
                    popup.style.display = "none"; // Hide the popup
                }, 3000);

                <% session.removeAttribute("successMessage"); %> // Clear the message after displaying
            }
        };

        // Function to close the popup manually
        function closePopup() {
            document.getElementById("loginSuccessPopup").style.display = "none";
        }
    </script>
</head>
<body>
    <%@ include file="facnavbar.jsp" %>

    <!-- Centered content -->
    <div class="center-content">
        <h2>Faculty Home</h2>
        <div class="welcome-message">Welcome <%= f.getName() %></div> <!-- Display faculty name -->
    </div>

    <!-- Login Success Popup Message -->
    <div id="loginSuccessPopup">
        <!-- Cancel Button -->
        <button class="cancel-btn" onclick="closePopup()">×</button>

        <!-- Tick Icon -->
        <svg class="tick-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M20.292 6.293a1 1 0 0 0-1.414 0L9 15.586l-4.879-4.88a1 1 0 0 0-1.414 1.414l6 6a1 1 0 0 0 1.414 0l12-12a1 1 0 0 0 0-1.414z"/>
        </svg>

        Login Successful
        <!-- Green line under the popup -->
        <div id="greenLine"></div>
    </div>

</body>
</html>
