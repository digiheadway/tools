<?php

include('function.php');
var_dump($user);

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
                    <p>15 Full Day + 14 Half Day</p>
                    <p><b>Or</b> 345 Hour Spent</p>
                </div>
               
            </section>
            
            <section class="second_section">
                <table>
                    <tbody>
                      <?php
                        foreach ($user['data'] as $row) {
                          var_dump($row);
                          echo "<tr><td>{$row['date']}</td><td>{$row['total_hours']} Hours</td></tr>";
                        }
                      ?>
                    </tbody>
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
