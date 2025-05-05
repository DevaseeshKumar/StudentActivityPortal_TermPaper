<%@ page import="com.klef.jfsd.sdp.model.Faculty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Faculty faculty = (Faculty) session.getAttribute("faculty");
if (faculty == null) {
    response.sendRedirect("faclogin.jsp"); // Redirect to login if faculty is not logged in
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Faculty</title>
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
        input[type="number"],
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
        input[type="number"]:focus,
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
    <%@include file="facnavbar.jsp" %>
    <h3><u>Update Faculty</u></h3>
    <div class="form-container">
        <form method="post" action="updatefaculty">
            <table>
                <tr>
                    <td><label for="fid">Faculty ID</label></td>
                    <td><input type="text" id="fid" name="fid" value="<%=faculty.getId()%>" readonly/></td>
                </tr>
                <tr>
                    <td><label for="fname">Enter Name</label></td>
                    <td><input type="text" id="fname" name="fname" value="<%=faculty.getName()%>" required/></td>
                </tr>
                <tr>
                    <td><label for="fpwd">Enter Password</label></td>
                    <td><input type="password" id="fpwd" name="fpwd" required/></td>
                </tr>
                <tr>
                    <td><label for="fdept">Select Department</label></td>
                    <td>
                        <select id="fdept" name="fdept" required>
                            <option value="">---Select---</option>
                            <option value="CSE" <%=faculty.getDepartment().equals("CSE") ? "selected" : ""%>>CSE</option>
                            <option value="ECE" <%=faculty.getDepartment().equals("ECE") ? "selected" : ""%>>ECE</option>
                            <option value="EEE" <%=faculty.getDepartment().equals("EEE") ? "selected" : ""%>>EEE</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="femail">Faculty Email</label></td>
                    <td><input type="email" id="femail" name="femail" value="<%=faculty.getEmail() %>" readonly/></td>
                </tr>
                <tr>
                    <td><label for="fcontact">Enter Contact Number</label></td>
                    <td><input type="text" id="fcontact" name="fcontact" value="<%=faculty.getContactno() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="flocation">Enter Location</label></td>
                    <td><input type="text" id="flocation" name="flocation" value="<%=faculty.getStatus()%>" required/></td>
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
