<?php
include("Database.php");


$user_name = $_COOKIE['user'];
if (!$user_name) {
    header("Location: login.php");
    die();
}

$checkIn = $_GET["checkin"] ?? null;
$checkOut = $_GET["checkout"] ?? null;

if ($checkIn or $checkOut) {

    header("Location: index.php");
    die();
}

define("QUERIES", [
    "HOURS_SPENT" => "SELECT date, sum(time_spent) as total_hours FROM attend WHERE name='$user_name' GROUP BY date",
    "LAST_CHECKOUT" => "SELECT id, CONCAT(date, ' ', checkin_time) as checkin_time FROM `attend` WHERE checkout_time is null and name = '$user_name' ORDER BY id DESC LIMIT 1;",
]);



function fetch_data()
{
    $db = new Database();
    $data = [
        "hours_spent" => $db->select(QUERIES["HOURS_SPENT"]),
        "last_checkout" => $db->select(QUERIES["LAST_CHECKOUT"])[0]
    ];
    $db->close();
    return $data;
}

function main($user_name)
{
    $data = fetch_data();
    try {
        return [
            "sql" => QUERIES["HOURS_SPENT"],
            "name" => ucwords($user_name),
            "hours_spent" => $data["hours_spent"],
            "last_checkout_id" => $data["last_checkout"]['id'] ?? null,
            "checkin_time" => $data["last_checkout"]['checkin_time']
        ];
    }
    catch (\Throwable $th) {
        echo "Error. " . $th->getMessage();
    }
}

$user = main($user_name);


?>
