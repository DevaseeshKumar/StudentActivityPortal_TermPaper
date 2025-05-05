<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Events</title>
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
    <%@ include file="studentnavbar.jsp" %> <!-- Assuming student-specific navbar -->
    <h3 style="text-align: center;"><u>Register Events</u></h3>
        <p style="text-align: center; font-size: 18px; color: #333;">Total Events:<c:out value="${ecount}"></c:out><br>
    <table>
        <tr>
            <th>Event ID</th>
            <th>Event Name</th>
            <th>Description</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>

            <th>Action</th>
        </tr>
        
        <!-- Loop through all available events -->
        <c:forEach items="${eventList}" var="event">
            <c:if test="${event.status == 'Available'}">
                <tr id="event-${event.eventId}">
                    <td><c:out value="${event.eventId}" /></td>
                    <td><c:out value="${event.name}"/></td>
                    <td><c:out value="${event.description}"/></td>
                    <td><c:out value="${event.date}"/></td>
                    <td><c:out value="${event.eventTime}"/></td>
                    <td><c:out value="${event.status}"/></td>

                    <td>
                        <form action="stueventreg" method="post">
                            <input type="hidden" name="eventId" value="${event.eventId}" />
                            <button type="submit">Register</button>
                        </form>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</body>
</html>
