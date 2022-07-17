<?php

include('function.php');
var_dump($user);
$hour_rows = "";
$half_days = 0;
$full_days = 0;
foreach ($user['data'] as $row) {
    $total_hours = intval($row['total_hours']);
    $hour_rows .= "<tr><td>{$row['date']}</td><td>$total_hours Hours</td></tr>";
    if($total_hours >= 8){
        $full_days++;
    }else{
        $half_days++;
    }
  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attandance Fetch Data</title>
    <link rel="stylesheet" href="style.css">                
</head>
<body>
    <div class="container">
            
        <header>
            <h1>Attendence System</h1>
            <p><?php echo $user['name'] ?></p>
        </header>
        <main>

            <section class="first_section">

                <p>Today You Spent: 0 Hour in Office</p>
                <button>Chek in </button>
                <div class="grop_contant">
                    <p><b>This Month</b></p>
                    <p><?php echo "$full_days Full Days + $half_days Half Days" ?></p>
                    <p><b>Or</b> 345 Hour Spent</p>
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
    <script src="script.js"></script>
</body>
</html>
