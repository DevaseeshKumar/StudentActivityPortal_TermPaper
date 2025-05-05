<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Faculty</title>
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
    <h3 style="text-align: center;"><u>Delete Faculty</u></h3>
        <p style="text-align: center; font-size: 18px; color: #333;">Total Faculty: <c:out value="${fcount}"></c:out></p>
    <table>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>DEPARTMENT</th>
            <th>CONTACT NO</th>
            <th>STATUS</th>
            <th>ACTION</th>
        </tr>
        
            <c:forEach items="${faclist}" var="faculty">
            <tr>
                <td><c:out value="${faculty.id}"/></td>
                <td><c:out value="${faculty.name}"/></td>
                <td><c:out value="${faculty.email}"/></td>
                <td><c:out value="${faculty.department}"/></td>
                <td><c:out value="${faculty.contactno}"/></td>
                <td><c:out value="${faculty.status}"/></td>
           
           <td>
             <a href='<c:url value="delete?id=${faculty.id}"></c:url>'>Delete</a>
           </td>

            </tr>
        </c:forEach>
    </table>
</body>
</html>