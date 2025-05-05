<!DOCTYPE html>
<html>
<head>
    <title>Activity Portal</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        .navbar {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            background: linear-gradient(to bottom, #001f3f, #003366);
            padding: 20px 10px;
            height: 100vh;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.2);
        }

        .navbar a, .dropdown-btn {
            color: #fff;
            text-align: left;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 18px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .navbar a:hover, .dropdown-btn:hover {
            background-color: rgba(255, 255, 255, 0.3);
            color: #000;
            border-radius: 5px;
        }

        .dropdown-container {
            display: none;
            flex-direction: column;
            background-color: rgba(0, 0, 0, 0.1);
            margin-left: 10px;
        }

        .dropdown-container a {
            padding-left: 30px;
            font-size: 16px;
        }

        .dropdown-container a:hover {
            background-color: rgba(255, 255, 255, 0.3);
            color: #000;
        }

        .navbar-heading {
            color: #fff;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
    <script>
        // Toggle dropdown menus
        function toggleDropdown(dropdownId) {
            const dropdown = document.getElementById(dropdownId);
            dropdown.style.display = dropdown.style.display === "flex" ? "none" : "flex";
        }
    </script>
</head>
<body>

    <div class="navbar">
        <h2 class="navbar-heading">Activity Portal</h2>
        <a href="/adminhome">Home</a>
        <div>
            <div class="dropdown-btn" onclick="toggleDropdown('facultyDropdown')">Faculty</div>
            <div class="dropdown-container" id="facultyDropdown">
                <a href="viewallfaculty">View All Faculty</a>
                <a href="deletefaculty">Delete Faculty</a>
            </div>
        </div>
        <div>
            <div class="dropdown-btn" onclick="toggleDropdown('studentDropdown')">Student</div>
            <div class="dropdown-container" id="studentDropdown">
                <a href="studentreg">Add Student</a>
                <a href="viewallstudents">View All Students</a>
                <a href="deletestudent">Delete Students</a>
            </div>
        </div>
        <div>
            <div class="dropdown-btn" onclick="toggleDropdown('eventsDropdown')">Events</div>
            <div class="dropdown-container" id="eventsDropdown">
                <a href="addevent">Add Events</a>
                <a href="viewallevents">View All Events</a>
                <a href="deleteevent">Delete Events</a>
                <a href="updateevent">Update Events</a>
            </div>
        </div>
        <a href="adminlogin">Logout</a>
    </div>
</body>
</html>
