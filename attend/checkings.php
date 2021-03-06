<?php

date_default_timezone_set("Asia/Calcutta");

function notify($username, $action)
{
    $message = urlencode("$username $action!");
    $phone = "9068062563,9050995106";
    $url = "https://wa.digiheadway.com/?pn=$phone&msg=$message";

    file_get_contents($url);
}

$user_name = $_COOKIE['user'];
if (!$user_name) {
    echo json_encode(['res' => 'error']);
    die();
}

function main($user_name)
{
    include_once("Database.php");
    $db = new Database();

    $time = date("H:i:s");
    $ip = $_SERVER["HTTP_CF_CONNECTING_IP"];
    $data = json_decode(trim(file_get_contents("php://input")), true);
    $lat = $data["lat"];
    $lon = $data["lon"];
    $location = "ST_GeomFromText('POINT($lat  $lon)')";
    $action = "checked in";
    if ($data["action"] == "checkIn") {
        $today = date("Y-m-d");

        $value_str = "'$user_name','$today', '$time', $location, '$ip'";
        $db->insert("attend", ["name", "date", "checkin_time", "checkin_loc", "checkin_ip"], $value_str);
    }
    else if ($data["action"] == "checkOut") {
        $action = "checked out";

        $set_str = "checkout_time = '$time', checkout_ip = '$ip', checkout_loc = $location";
        $db->update("attend", $set_str, $data["id"]);
    }

    $db->close();
    notify($user_name, $action);
}

try {
    main($user_name);
    echo json_encode(['res' => 'success']);
}
catch (\Throwable $th) {
    echo json_encode(['res' => 'error', 'error' => $th->getMessage()]);
}





?>