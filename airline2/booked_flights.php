<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booked Flights Table</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #333;
        }

        section {
            padding: 40px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #f2f2f2;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        .navbar-custom .navbar-nav-first>li>a:hover,
        .navbar-custom .navbar-nav-first>li.active>a {
            color: #fff !important;
            background-color: #000 !important;
        }

        .navbar-custom {
            border-color: #000 !important;
            border: none !important;
        }

        .form_design input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
        }

        .form_design input[type="submit"] {
            background-color: #000;
            color: #fff;
            cursor: pointer;
        }

        .form_design input[type="submit"]:hover {
            background-color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

    <!-- MENU -->
    <style>
        .navbar-custom .navbar-nav-first>li>a:hover,
        .navbar-custom .navbar-nav-first>li.active>a {
            color: #fff !important;
            background-color: #000 !important;
        }

        .navbar-custom {
            border-color: #000 !important;
            border: none !important;
        }
    </style>

    <section class="navbar custom-navbar navbar-fixed-top navbar-custom" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon icon-bar"></span>
                    <span class="icon icon-bar"></span>
                    <span class="icon icon-bar"></span>
                </button>
            </div>

            <!-- MENU LINKS -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-nav-first">
                <li><a href="admin_home.php">Profile</a></li>
                    <li><a href="users.php">Users</a></li>
                
                    <li><a href="pilot.php">Pilots</a></li>
                    <li><a href="airlines.php">Airlines</a></li>
                    <li><a href="admin_tickets.php">Tickets</a></li>
                    <li class="active"><a href="booked_flights.php">Bookings</a></li>
                   
                    <li><a href="login.php">Logout</a></li>
                </ul>
            </div>
        </div>
    </section>

    <!-- TABLE SECTION -->
    <section id="section1">
        <div class="container">
            <div class="title">Booked Flights Table</div>

            <?php
            // SQL query to retrieve data from the "booked_flights" table
            require_once('dbconnect.php');
            $sql = "SELECT * FROM booked_flights";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                // Display table header
                echo "<table><tr><th>Username</th><th>Flight Id</th><th>Ticket Number</th><th>Price (IDR)</th><th>Seat Number</th><th>Class</th></tr>";

                // Output data of each row
                while ($row = $result->fetch_assoc()) {
                    echo "<tr><td>" . $row["username"] . "</td><td>" . $row["flight_id"] . "</td><td>" . $row["ticket_number"] . "</td><td>" . $row["price"] . "</td><td>" . $row["seat_number"] . "</td><td>" . $row["class"] . "</td></tr>";
                }

                // Close table
                echo "</table>";
            } else {
                echo "0 results";
            }

            // Close connection
            $conn->close();
            ?>
        </div>
    </section>

    <!-- INSERT SECTION -->
    <section id="section2">
        <div class="container">
            <div class="title">Add a New Booking</div>

            <form action="insert_booked_flights.php" class="form_design" method="post">
                Username: <input type="text" name="busername"> <br />
                Flight Id: <input type="text" name="bflight_id"> <br />
                Ticket Number: <input type="number" name="bticket_number"> <br />
                Price (IDR): <input type="number" name="bprice"> <br />
                Seat Number: <input type="text" name="bseat_number"> <br />
                Class: <input type="text" name="bclass"> <br />
                <br />
                <input type="submit" value="Add to Database">
            </form>
        </div>
    </section>

    <!-- DELETE SECTION -->
    <section id="section3">
        <div class="container">
            <div class="title">Delete Booking</div>

            <form action="insert_booked_flights.php" method="get">
                <label for="bticket_number">Enter Ticket_number to Delete:</label>
                <input type="number" id="bticket_number" name="bticket_number" required>
                <button type="submit">Delete</button>
            </form>
        </div>
    </section>

    <!-- SCRIPTS -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>
