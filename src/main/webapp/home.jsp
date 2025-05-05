<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activity Portal</title>
<style>
    /* Ensure the body covers the full height */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    body {
        background-image: url('Home.jpeg');
        background-size: contain; /* Ensures the image is scaled to fit within the viewport */
        background-position: right center; /* Centers the image */
        background-repeat: no-repeat; /* Prevents the image from repeating */
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center; /* Centers content horizontally */
        margin-left: 220px; /* Offset content to account for the sidebar */
        min-height: 100vh; /* Ensure the body takes up the full height of the viewport */
    }

    /* Adjust navbar to ensure it is fixed on the left */
    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 200px;
        height: 100%;
        background-color: #333;
        color: white;
        padding: 10px 0;
        box-sizing: border-box;
        z-index: 10; /* Ensure navbar is above content */
    }

    /* Navbar item styling */
    .navbar a {
        color: white;
        padding: 14px 20px;
        text-decoration: none;
        width: 100%;
        box-sizing: border-box;
    }

    .navbar a:hover {
        background-color: #555;
    }

    /* Content styling */
    .content {
        margin-top: 80px; /* Adjust to move content below the navbar */
        text-align: center;
        color: white;
        font-size: 24px;
        font-family: Arial, sans-serif;
        padding: 20px;
        background-color: rgba(0, 0, 0, 0.5); /* Optional: Adds a slight background to make text more readable */
        border-radius: 10px;
        width: 50%;
    }
</style>
</head>
<body>
<%@include file="mainnavbar.jsp" %>

<!-- Main content below the navbar -->
<div class="content">
    <ol>
        Welcome to Student Activity Portal
    </ol>
</div>
</body>
</html>
