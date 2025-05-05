<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="mainnavbar.jsp" %>
    <title>Student Login Fail</title>
    <style>
        /* Popup styling */
        #loginFailPopup {
            display: none;
            background-color: white;
            color: red; /* Red color for failure */
            padding: 10px;
            text-align: left;
            position: fixed;
            top: 20px; /* Set top position */
            right: -300px; /* Start off-screen to the right */
            z-index: 1000;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: slideInTopRight 0.5s forwards; /* Slide-in animation */
            width: 300px;
        }

        /* Red line under the popup */
        #redLine {
            height: 4px;
            background-color: red; /* Red line for failure */
            width: 0%; /* Start the width at 0% */
            animation: slideLine 1s forwards; /* Slide the line from right to left */
            margin-top: 5px; /* Space between text and line */
        }

        /* Keyframe animation for sliding in from the top-right */
        @keyframes slideInTopRight {
            0% {
                right: -300px; /* Start off-screen to the right */
                top: 20px; /* Keep the popup at the top */
            }
            100% {
                right: 20px; /* End at 20px from the right edge */
                top: 20px; /* Keep the popup at the top */
            }
        }

        /* Keyframe animation for the red line sliding */
        @keyframes slideLine {
            0% {
                width: 0%; /* Start with no width */
            }
            100% {
                width: 100%; /* End with full width */
            }
        }

        /* Cross icon styling */
        .cross-icon {
            width: 18px;
            height: 18px;
            margin-right: 10px;
            vertical-align: middle;
            fill: red; /* Red color for failure */
        }

        /* Cancel button styling */
        .cancel-btn {
            background: none;
            border: none;
            color: red;
            font-size: 18px;
            font-weight: bold;
            position: absolute;
            top: 5px;
            right: 5px;
            cursor: pointer;
        }

        /* Centering the message and try again link */
        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh; /* Full height of the screen */
            text-align: center; /* Center the text */
        }
    </style>
</head>
<body>
    <!-- Login Fail Popup Message -->
    <div id="loginFailPopup">
        <!-- Cancel Button -->
        <button class="cancel-btn" onclick="closePopup()">×</button>

        <!-- Cross Icon -->
        <svg class="cross-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M18.364 5.636a1 1 0 0 0-1.414 0L12 9.586 6.05 3.636a1 1 0 0 0-1.414 1.414L10.586 11l-5.95 5.95a1 1 0 0 0 1.414 1.414L12 12.414l5.95 5.95a1 1 0 0 0 1.414-1.414L13.414 11l5.95-5.95a1 1 0 0 0 0-1.414z"/>
        </svg>

        Login Failed
        <!-- Red line under the popup -->
        <div id="redLine"></div>
    </div>

    <!-- Centered content with message and try again link -->
    <div class="center-content">
        <c:out value="${message}"></c:out>
        <br><br>
        <a href="studentlogin">Try Again</a>
    </div>

    <script>
        // Show the failure popup if a failure message exists
        window.onload = function() {
            const failureMessage = '<%= session.getAttribute("failureMessage") %>';
            if (failureMessage) {
                const popup = document.getElementById("loginFailPopup");
                popup.style.display = "block"; // Show the popup

                // Hide the popup after 3 seconds
                setTimeout(function() {
                    popup.style.display = "none"; // Hide the popup
                }, 3000);

                <% session.removeAttribute("failureMessage"); %> // Clear the message after displaying
            }
        };

        // Function to close the popup manually
        function closePopup() {
            document.getElementById("loginFailPopup").style.display = "none";
        }
    </script>
</body>
</html>
