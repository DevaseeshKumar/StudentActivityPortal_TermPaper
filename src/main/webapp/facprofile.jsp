<%@ page import="com.klef.jfsd.sdp.model.Faculty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) {
    response.sendRedirect("facsessionfail");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .profile-container {
        max-width: 400px;
        width: 90%;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
        margin: 20px auto;
    }

    .profile-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .profile-details p {
        margin: 10px 0;
        font-size: 16px;
        color: #555;
        text-align: left;
    }

    .profile-details p strong {
        color: #000;
    }
</style>
</head>
<body>
<%@include file="facnavbar.jsp" %>

<div class="profile-container">
    <h2>Faculty Profile</h2>
    <div class="profile-details">
        <p><strong>ID:</strong> <%= f.getId() %></p>
        <p><strong>Name:</strong> <%= f.getName() %></p>
        <p><strong>Email:</strong> <%= f.getEmail() %></p>
        <p><strong>Department:</strong> <%= f.getDepartment() %></p>
        <p><strong>Contact Number:</strong> <%= f.getContactno() %></p>
        <p><strong>Status:</strong> <%= f.getStatus() %></p>
        <p><strong>Location:</strong> <%= f.getLocation() %></p>
    </div>
</div>

</body>
</html>
