<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Add box-shadow for better visuals */
        }

        table, th, td {
            border: 1px solid #ddd; /* Light border */
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            font-size: 16px; /* Consistent font size */
            word-wrap: break-word;
        }

        th {
            background: linear-gradient(135deg, #001f3f, #003366); /* Matching navbar gradient */
            color: #fff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        tr:hover {
            background-color: rgba(0, 0, 0, 0.1); /* Highlight row on hover */
            transition: background-color 0.3s ease;
        }

        h3 {
            text-align: center;
            font-size: 24px;
            color: #003366; /* Matching theme color */
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <h3 style="text-align: center;"><u>View All Students</u></h3>
    <p style="text-align: center; font-size: 18px; color: #333;">Total Students: <c:out value="${scount}"></c:out><br>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Contact No</th>
            <th>Gender</th>
            <th>DOB</th>
        </tr>
        <c:forEach items="${studentList}" var="student">
            <tr>
                <td><c:out value="${student.id}"/></td>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.email}"/></td>
                
                <td><c:out value="${student.department}"/></td>
                <td><c:out value="${student.contactno}"/></td>
                <td><c:out value="${student.gender}"/></td>
                <td><c:out value="${student.dob}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
