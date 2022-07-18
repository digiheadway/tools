<?php

include('function.php');

$hour_rows = "";
$half_days = 0;
$full_days = 0;
$today_hours = 0;
$today = date("Y-m-d");
$total_hours_spent = 0;
foreach ($user['hours_spent'] as $row) {
    $total_hours = intval($row['total_hours']);
    $hour_rows .= "<tr><td>{$row['date']}</td><td>$total_hours Hours</td></tr>";
    
    // Calculating half & full days
    if($total_hours >= 8){
        $full_days++;
    }else{
        $half_days++;
    }

    // checking today hours
    if($row['date'] == $today){
        $today_hours = $total_hours;
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
    <link rel="stylesheet" href="style.css?v=0.0.0">                
</head>
<body>
    <div class="container">
            
        <header>
            <h1>Attendence System</h1>
            <p><?php echo $user['name'] ?></p>
        </header>
        <main>
            <section class="first_section">
                <p>Today You Spent: <? echo $today_hours  ?> Hour in Office</p>
                <?php if($user['last_checkout_id'] == null) {?>
                    <button onclick='checkIn()'>Check in</a> </button>
                <?php } else { ?>
                    <button onclick="checkOut(<?php echo $user['last_checkout_id'] ?>)">Check out </button>
                <?php } ?>

               
                <div class="grop_contant">
                    <p><b>This Month</b></p>
                    <p><?php echo "$full_days Full Days + $half_days Half Days" ?></p>
                    <p><b>Or</b> <?php echo $total_hours_spent ?>  Hours Spent</p>
                </div>
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
                                <td></td>
                            </tr>
                            <tr>
                                <td>IP</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Time</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

        </main>
    
    </div>
    <script src="script.js?v=0.0.4"></script>
</body>
</html>
