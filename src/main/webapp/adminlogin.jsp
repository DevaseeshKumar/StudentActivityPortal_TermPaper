<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* Ensure the body takes up full height */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        /* Body background styling */
        body {
            background-image: url('Login.jpg');
            background-size: cover; /* Cover the entire screen */
            background-position: center center; /* Center the image */
            background-repeat: no-repeat; /* Ensure it doesn't repeat */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh; /* Ensure the body takes full viewport height */
            position: relative; /* Ensure backdrop-filter works */
        }

        /* Form container styling with transparency */
        .form-container {
            background-color: rgba(255, 255, 255, 0.5); /* Fully transparent background */
            border-radius: 8px;
            padding: 20px;
            width: 60%;
            max-width: 600px;
            margin-top: 100px; /* Adjust to place form below navbar */
            border: 1px solid rgba(255, 255, 255, 0.5); /* Subtle border */
            position: relative; /* Ensure it's above the background */
        }

        h3 {
            text-align: center;
            color: white; /* Change text color to white */
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

        /* Make label text black */
        label {
            font-weight: bold;
            color: black; /* Labels are now black */
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
            background-color: #ecf0f1; /* Lighter background color for input fields */
            color: #2c3e50; /* Text color in inputs */
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #2980b9; /* Focused border color */
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
            background-color: #3498db; /* Blue color for submit */
            color: white;
        }

        input[type="reset"] {
            background-color: #f39c12; /* Yellow color for reset */
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #2980b9; /* Darker blue for submit button hover */
        }

        input[type="reset"]:hover {
            background-color: #e67e22; /* Darker yellow for reset button hover */
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <h3 style="text-align: center;"><u>Admin Login</u></h3>
    <div class="form-container">
        <form method="post" action="checkadminlogin">
            <table>
                <tr>
                    <td><label for="auname">Enter Username</label></td>
                    <td><input type="text" id="auname" name="auname" required/></td>
                </tr>
                <tr>
                    <td><label for="apwd">Enter Password</label></td>
                    <td><input type="password" id="apwd" name="apwd" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
