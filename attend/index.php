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
    <link rel="stylesheet" href="style.css?v=0.0.4">                
</head>
<body>
    <div class="container">
            
        <header>
            <h1>Attendence System</h1>
            <p><?php echo $user['name'] ?></p>
        </header>
        <main>
            <section class="first_section">
            <img src="<?php echo $img[array_rand($img)]; ?>" class="center">
                <p>Today You Spent: <? echo $today_duration  ?> in Office</p>
                <?php if($user['last_checkout_id'] == null) {?>
                    <button onclick='checkIn()'>Check in</a> </button>
                <?php } else { ?>
                    <p id="session_timing" data-time='<?php echo $user['checkin_time'] ?>'>Session Time: </p>
                    <button style='background-color: #333333;' onclick="checkOut(<?php echo $user['last_checkout_id'] ?>)">Check out </button>
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
    <script src="script.js?v=0.1.7"></script>
   
    <div id="loader"><img src="loading.png"  alt="" width="100%"></div>
</body>
</html>
