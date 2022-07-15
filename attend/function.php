<?php

$user = $_COOKIE['user'];
if (!$user) {
    header("Location: login.php");
    die();
}

$servername = "localhost";
$username = "u240376517_tools";
$password = "#DNhomg$:p7L";
$dbname = "u240376517_tools";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT date, sum(time_spent) as total_hours FROM attend WHERE name='" . $user . "' GROUP BY date";
$result = $conn->query($sql);

if ($result) {
    $rows = $result->fetch_all(MYSQL_ASSOC);
    var_dump($rows);
    echo "<table><tr><th>Date</th><th>Time Spent</th></tr>";
    foreach ($rows as $row) {
        echo "<tr><td>" . $row["date"] . "</td><td>" . $row["total_hours"] . "</td></tr>";
    }
    echo "</table>";
}
else {
    echo "0 results";
}


$conn->close();
?>
