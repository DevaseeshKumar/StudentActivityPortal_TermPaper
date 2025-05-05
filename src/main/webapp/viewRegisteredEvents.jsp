<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Events</title>
    <style>
        /* Styling for event cards */
        .event-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .event-card h3 {
            color: #4CAF50;
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .event-card p {
            color: #555;
            margin-bottom: 10px;
        }

        .event-card .event-date {
            font-weight: bold;
            color: #2196F3;
        }

        .event-card .event-description {
            font-style: italic;
            color: #777;
        }

        .no-events {
            text-align: center;
            font-size: 1.2em;
            color: #FF6347;
        }

        .event-details {
            font-size: 0.9em;
            color: #333;
            margin-top: 10px;
        }

        /* Center the container of the event cards */
        .event-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            margin-top: 20px;
        }
    </style>
</head>
<%@include file="studentnavbar.jsp" %>

<body>
    <h2 style="text-align: center;">Registered Events</h2>

    <c:if test="${not empty registeredEvents}">
        <div class="event-container">
            <c:forEach var="event" items="${registeredEvents}">
                <div class="event-card">
                    <h3>${event.name}</h3>
                    <p class="event-date">${event.date} at ${event.eventTime}</p>
                    <p class="event-description">${event.description}</p>

                    <!-- Display additional attributes -->
                    <div class="event-details">
                        <!-- <p><strong>Status:</strong> ${event.status}</p>
                        <p><strong>Total Capacity:</strong> ${event.totalCount}</p>--> 
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${empty registeredEvents}">
        <p class="no-events">You have not registered for any events.</p>
    </c:if>
</body>
</html>
