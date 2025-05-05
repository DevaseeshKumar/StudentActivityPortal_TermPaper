<%@ page import="com.klef.jfsd.sdp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Student student = (Student) session.getAttribute("student");
if (student == null) {
    response.sendRedirect("studentlogin.jsp"); // Redirect to login if student is not logged in
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* Reusing provided CSS */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            background-image: url('Login.jpg');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            position: relative;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 8px;
            padding: 20px;
            width: 60%;
            max-width: 600px;
            margin-top: 100px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            position: relative;
        }

        h3 {
            text-align: center;
            color: white;
            font-size: 1.6em;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table td {
            padding: 12px;
        }

        label {
            font-weight: bold;
            color: black;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #bdc3c7;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #ecf0f1;
            color: #2c3e50;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #2980b9;
            outline: none;
        }

        .button-container {
            text-align: center;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 12px 24px;
            margin: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
        }

        input[type="reset"] {
            background-color: #f39c12;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        input[type="reset"]:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>
    <%@include file="studentnavbar.jsp" %>
    <h3><u>Update Profile</u></h3>
    <div class="form-container">
        <form method="post" action="editstuprofile">
            <table>
                <tr>
                    <td><label for="studentId">Student ID</label></td>
                    <td><input type="text" id="studentId" name="studentId" value="<%=student.getId()%>" readonly/></td>
                </tr>
                <tr>
                    <td><label for="studentName">Name</label></td>
                    <td><input type="text" id="studentName" name="studentName" value="<%=student.getName()%>" required/></td>
                </tr>
                <tr>
                    <td><label for="password">Password</label></td>
                    <td><input type="password" id="password" name="password" required/></td>
                </tr>
                <tr>
                    <td><label for="department">Department</label></td>
                    <td>
                        <select id="department" name="department" required>
                            <option value="">---Select---</option>
                            <option value="CSE" <%=student.getDepartment().equals("CSE") ? "selected" : ""%>>CSE</option>
                            <option value="ECE" <%=student.getDepartment().equals("ECE") ? "selected" : ""%>>ECE</option>
                            <option value="EEE" <%=student.getDepartment().equals("EEE") ? "selected" : ""%>>EEE</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input type="email" id="email" name="email" value="<%=student.getEmail()%>" readonly/></td>
                </tr>
                <tr>
                    <td><label for="contactNumber">Contact Number</label></td>
                    <td><input type="text" id="contactNumber" name="contactNumber" value="<%=student.getContactno()%>" required/></td>
                </tr>
                <tr>
                    <td><label for="gender">Gender</label></td>
                    <td>
                        <select id="gender" name="gender" required>
                            <option value="">---Select---</option>
                            <option value="Male" <%=student.getGender().equals("Male") ? "selected" : ""%>>Male</option>
                            <option value="Female" <%=student.getGender().equals("Female") ? "selected" : ""%>>Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="dob">Date of Birth</label></td>
                    <td><input type="text" id="dob" name="dob" value="<%=student.getDob()%>" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
