<?php
include("Database.php");
$user_name = "";
define("QUERIES", [
    "HOURS_SPENT" => "SELECT date, sum(time_spent) as total_hours FROM attend WHERE name='$user_name' GROUP BY date"
]);

function fetch_data()
{
    $db = new Database();
    $data = $db->select(QUERIES["HOURS_SPENT"]);
    $db->close();
    return $data;
}

function main()
{
    global $user_name;
    try {

        $user_name = $_COOKIE['user'];
        if (!$user_name) {
            header("Location: login.php");
            die();
        }

        return [
            "name" => ucwords($user_name),
            "data" => fetch_data()
        ];
    }
    catch (\Throwable $th) {
        echo "Error. " . $th->getMessage();
    }
}

$user = main();


?>
