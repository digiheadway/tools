<!DOCTYPE html>
<html>
<body>

<?php
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

$sql = "SELECT id, name, date FROM attend";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<br> id: ". $row["id"]. " - Name: ". $row["name"]. " " . $row["date"] . "<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>

<!--

id	
name	
date	
checkin_time	
checkin_ip	
checkin_loc	
checkout_time	
checkout_ip	
checkout_loc	
time_spent


-->
</body>
</html>
