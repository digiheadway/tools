<?php
include("Database.php");

define("QUERIES", [
    "HOURS_SPENT" => "SELECT date, sum(time_spent) as total_hours FROM attend WHERE name='$user' GROUP BY date"
]);

function fetch_data($user)
{
    $db = new Database();
    $data = $db->select(QUERIES["HOURS_SPENT"]);
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
