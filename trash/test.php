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
<!DOCTYPE html>
<html>
<head>


  <style>
table, th, td {
    border: 1px solid black;
}
</style>
  </head>
<body>




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

<script>
checkCookie();

function checkCookie() {
    let user = getCookie("user");
    if (user != "") {
    //  alert("Welcome again " + user);
    } else {
       user = prompt("Please enter your name:","");
       if (user != "" && user != null) {
         setCookie("user", user, 30);
         location.reload();
  
       }
    }
  }

  function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}
  
function setCookie(cname,cvalue,exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  let expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}


var x = document.getElementById("demo");

getLocation();

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}
</script>
</body>
</html>
