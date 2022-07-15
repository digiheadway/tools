<?php


function fetch_data($user)
{
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

    $sql = "SELECT date, sum(time_spent) as total_hours FROM attend WHERE name='$user' GROUP BY date";
    // $sql = "Describe `attend`";
    $result = $conn->query($sql);
    var_dump($result);
    echo $sql;
    if ($result) {
        $rows = $result->fetch_all();
        var_dump($rows);
        $conn->close();
        return $rows;
    }
    else {
        $conn->close();
        throw new Exception('Error' . $conn->error, 1);
    }
}

function create_table($rows)
{
    echo "<table><tr><th>Date</th><th>Time Spent</th></tr>";
    foreach ($rows as $row) {
        echo "<tr><td>" . $row["date"] . "</td><td>" . $row["total_hours"] . "</td></tr>";
    }
    echo "</table>";
}

function main()
{
    try {

        $user = $_COOKIE['user'];
        if (!$user) {
            header("Location: login.php");
            die();
        }

        $rows = fetch_data($user);
        var_dump($rows);
        create_table($rows);
    }
    catch (\Throwable $th) {
        echo "Error. " . $th->getMessage();
    }
}

main();


?>
