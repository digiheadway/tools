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

$sql = "SELECT id, name, date FROM attend Where name = '" .$user ."'";
echo $sql;
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "<table><tr><th>Date</th><th>Time Spent</th></tr>";
  // output data of each row
  while($row = $result->fetch_assoc()) {
      echo "<tr><td>" . $row["date"]. "</td><td>" . $row["name"]. "</td></tr>";
  }
  echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>