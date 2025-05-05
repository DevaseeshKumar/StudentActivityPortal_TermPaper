<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Event</title>
    <style>
        form {
            width: 50%;
            margin: 0 auto;
        }
        label, input, textarea {
            display: block;
            margin: 10px 0;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>

    <%@ include file="adminnavbar.jsp" %>

    <h2 style="text-align: center;">Edit Event</h2>

    <form action="updateeventdetails" method="post">
        <input type="hidden" name="eventId" value="${event.eventId}" />

        <label for="name">Event Name:</label>
        <input type="text" id="name" name="name" value="${event.name}" required/>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${event.description}</textarea>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="${event.date}" required/>

        <label for="time">Time:</label>
        <input type="time" id="time" name="time" value="${event.eventTime}" required/>

        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="${event.status}" required/>

        <button type="submit">Update Event</button>
    </form>

</body>
</html>
