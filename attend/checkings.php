<?php



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


$time = date("h:i:s");
$ip = $_SERVER["HTTP_CF_CONNECTING_IP"];
$lat = $data["lat"];
$lon = $data["lon"];
$data = json_decode(trim(file_get_contents("php://input")), true);

if ($data["action"] == "checkIn") {
    $today = date("Y-m-d");

    $query = "INSERT INTO attend (name, date, checkin_time, checkin_loc, checkin_ip) VALUES ('$user_name','$today', '$time', POINT($lat $lon), '$ip')";
    process_query($query);
}
else if ($data["action"] == "checkOut") {
    $id = $data["id"];
    $query = "UPDATE attend SET checkout_time = '$time', checkout_ip = '$ip', checkout_loc = POINT($lat, $lon) WHERE id = $id";
    process_query($query);
}

echo json_encode(['res' => 'success']);



?>