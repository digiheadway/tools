<?php
include("Database.php");

function fetch_data($user)
{
    $db = new Database();
    $sql = "SELECT date, sum(time_spent) as total_hours FROM attend WHERE name='$user' GROUP BY date";
    $data = $db->select($sql);
    $db->close();
    return $data;
}

function main()
{
    try {

        $user = $_COOKIE['user'];
        if (!$user) {
            header("Location: login.php");
            die();
        }

        return [
            "name" => ucwords($user),
            "data" => fetch_data($user)
        ];
    }
    catch (\Throwable $th) {
        echo "Error. " . $th->getMessage();
    }
}

$user = main();


?>
