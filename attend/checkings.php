<?php

date_default_timezone_set("Asia/Calcutta");

function notify($username, $action)
{
    $message = urlencode("$username $action!");
    $phone = "9068062563,9050995106";
    $url = "https://wa.digiheadway.com/?pn=$phone&msg=$message";

    file_get_contents($url);
}

function process_query($query)
{
    include_once("Database.php");
    $db = new Database();
    $db->process_query($query);
    $db->close();

}

$user_name = $_COOKIE['user'];
if (!$user_name) {
    echo json_encode(['res' => 'error']);
    die();
}

function main($user_name)
{
    $time = date("H:i:s");
    $ip = $_SERVER["HTTP_CF_CONNECTING_IP"];
    $data = json_decode(trim(file_get_contents("php://input")), true);
    $lat = $data["lat"];
    $lon = $data["lon"];
    $location = "ST_GeomFromText('POINT($lat  $lon)')";
    $action = "checked in";
    if ($data["action"] == "checkIn") {
        $today = date("Y-m-d");
        
        $query = "INSERT INTO attend (name, date, checkin_time, checkin_loc, checkin_ip) VALUES ('$user_name','$today', '$time', $location, '$ip')";
        process_query($query);
    }
    else if ($data["action"] == "checkOut") {
        $action = "checked out";
        $id = $data["id"];
        $query = "UPDATE attend SET checkout_time = '$time', checkout_ip = '$ip', checkout_loc = $location WHERE id = $id";
        process_query($query);
    }

    notify($user_name, $action );
}

try {
    main($user_name);
    echo json_encode(['res' => 'success']);
}
catch (\Throwable $th) {
    echo json_encode(['res' => 'error', 'error' => $th->getMessage()]);
}





?>