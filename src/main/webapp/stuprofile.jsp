<%@ page import="com.klef.jfsd.sdp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
Student s = (Student) session.getAttribute("student");
if (s == null) {
    response.sendRedirect("stusessionfail");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>
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
<%@ include file="studentnavbar.jsp" %>

<div class="profile-container">
    <h2>Student Profile</h2>
    <div class="profile-details">
        <p><strong>ID:</strong> <%= s.getId() %></p>
        <p><strong>Name:</strong> <%= s.getName() %></p>
        <p><strong>Email:</strong> <%= s.getEmail() %></p>
        <p><strong>Department:</strong> <%= s.getDepartment() %></p>
        <p><strong>Contact Number:</strong> <%= s.getContactno() %></p>
        <p><strong>Gender:</strong> <%= s.getGender() %></p>
        <p><strong>Date of Birth:</strong> <%= s.getDob() %></p>
    </div>
</div>

</body>
</html>
