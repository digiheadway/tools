<?php

include('function.php');


$hour_rows = "";
$half_days = 0;
$full_days = 0;
$today_duration = 0;
$today = date("Y-m-d");
$total_hours_spent = 0;
foreach ($user['hours_spent'] as $row) {
    if($row['total_seconds'] == null) continue;
    $total_hours = intval($row['total_seconds'] / (60*60));
    $duration = gmdate("H:i", $row["total_seconds"]);
    $date = date("d M", strtotime($row['date']));  
    $hour_rows .= "<tr><td>$date</td><td>$duration</td></tr>";
    
    // Calculating half & full days
    if($total_hours >= 7){
        $full_days++;
    }else{
        $half_days++;
    }

    // checking today hours
    if($row['date'] == $today){
        $today_duration = $duration;
    }

    // calculating total hours
    $total_hours_spent = $total_hours_spent + $total_hours;
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attandance Fetch Data</title>
    <link rel="stylesheet" href="style.css?v=0.0.2">                
</head>
<body>
    <div class="container">
            
        <header>
            <h1>Attendence System</h1>
            <p><?php echo $user['name'] ?></p>
        </header>
        <main>
            <img width="80%" src="https://img.freepik.com/premium-vector/inspirational-motivation-quotes-harder-you-work-better-you-get_67445-139.jpg?w=1380" alt="">
                <p>Today You Spent: <? echo $today_duration  ?> in Office</p>
                <?php if($user['last_checkout_id'] == null) {?>
                    <button onclick='checkIn()'>Check in</a> </button>
                <?php } else { ?>
                    <p id="session_timing" data-time='<?php echo $user['checkin_time'] ?>'>Session Time: </p>
                    <button style='background-color: tomato;' onclick="checkOut(<?php echo $user['last_checkout_id'] ?>)">Check out </button>
                <?php } ?>

               
                <div class="grop_contant">
                    <p><b>This Month</b></p>
                    <p><?php echo "$full_days Full Days + $half_days Partial Days" ?></p>
                    <p><b>Or</b> <?php echo $total_hours_spent ?>  Hours Spent</p>
                </div>
                <p>Date-wise Durations</p>
            </section>
            <section class="second_section">
                <table>
                    <tbody> <?php echo $hour_rows; ?> </tbody>
                </table>
                <div class="address">
                    <table>
                        <tbody>
                            <tr>
                                <td>Location</td>
                                <td id='location'></td>
                            </tr>
                            <tr>
                                <td>IP</td>
                                <td><?php echo $_SERVER["HTTP_CF_CONNECTING_IP"] ?></td>
                            </tr>
                            <tr>
                                <td>Time</td>
                                <td id='timer'></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

        </main>
    
    </div>
   <script>
    let locationDiv = document.querySelector("#location");
let timeDiv = document.querySelector("#timer");

setInterval(() => {
  timeDiv.textContent = new Date().toTimeString().split(" ")[0];
}, 1000);

let pos = {
  lat: 0,
  lon: 0,
};

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition((position) => {
    pos.lat = position.coords.latitude;
    pos.lon = position.coords.longitude;
    locationDiv.textContent = `(${pos.lat}, ${pos.lon})`;
  });
}

async function checkIn() {
  console.log(`Check in`);
  let result = await request({ action: "checkIn" });
  console.log(result);
  location.reload();
}

async function checkOut(id) {
  console.log(`Check out: ${id}`);
  let result = await request({ action: "checkOut", id: id });
  console.log(result);
  location.reload();
}

async function request(data) {
  data.lat = pos.lat;
  data.lon = pos.lon;
  let result = await fetch("checkings.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });

  let response = await result.json();
  return response;
}

let sessionTimeDiv = document.querySelector("#session_timing");
if (sessionTimeDiv) {
  let checkInTime = sessionTimeDiv.dataset.time;
  setInterval(function () {
    let diff_in_sec = (new Date() - new Date(checkInTime)) / 1000;
    let hours = padNumber(diff_in_sec / (60 * 60));
    let minutes = padNumber((diff_in_sec / 60) % 60);
    let seconds = padNumber(diff_in_sec % 60);

    sessionTimeDiv.textContent = `Session time: ${hours}:${minutes}:${seconds}`;
  }, 1000);
}

function padNumber(float) {
  return parseInt(float).toString().padStart(2, 0);
}

   </script>

</body>
</html>
