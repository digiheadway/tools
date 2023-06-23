<?php

date_default_timezone_set("Asia/Calcutta");

/* function notify($username, $action, $time)
{
    $message = urlencode("$username $action at $time");
    $phone = "9068062563,9050995106,7404169591";
    $url = "https://wa.digiheadway.com/?pn=$phone&msg=$message";
  //  $url = "https://webhook.site/7ab9bc24-8165-4f85-b7ce-54cb4e073f7b";

    file_get_contents($url);
}
*/
function notify($username, $action, $time)
{
    $message = "$username $action at $time";

    // Slack Incoming Webhook URL
    $webhookUrl = "https://hooks.slack.com/services/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";

    $payload = json_encode(array('text' => $message));

    $options = array(
        'http' => array(
            'header'  => "Content-type: application/json",
            'method'  => 'POST',
            'content' => $payload
        )
    );

    $context  = stream_context_create($options);
    $result = file_get_contents($webhookUrl, false, $context);
}

$user_name = $_COOKIE['user'];
if (!$user_name) {
    echo json_encode(['res' => 'error']);
    die();
}

function main($user_name)
{
    include_once("database.php");
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
    notify($user_name, $action, $time);
}

try {
    main($user_name);
    echo json_encode(['res' => 'success']);
}
catch (\Throwable $th) {
    echo json_encode(['res' => 'error', 'error' => $th->getMessage()]);
}





?>
