<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="mainnavbar.jsp" %>
    <title>Session Expired</title>
    <style>
        /* Center the content */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .content {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>Session Expired</h2>
        <p>Your session has expired. Please <a href="faclogin.jsp">login again</a>.</p>
    </div>
</body>
</html>
