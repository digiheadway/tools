<?php
include("database.php");


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
    "HOURS_SPENT" => "SELECT date, cast((sum(TO_SECONDS(checkout_time) - TO_SECONDS(checkin_time))) as int) as total_seconds FROM attend WHERE name='$user_name' and MONTH(checkin_time) = MONTH(NOW()) GROUP BY date",
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

$img=array("https://everydaypower.com/wp-content/uploads/2021/12/Best-Motivational-Work-quotes-of-the-day.png",
"http://wewishes.com/wp-content/uploads/2020/11/Hard-Work-Quotes-6.jpg",
"https://www.invictusstudio.com/blog/wp-content/uploads/2020/06/Bill-gates-quote.jpg",
"https://i.etsystatic.com/10443744/r/il/abe05c/1692556339/il_fullxfull.1692556339_mftv.jpg",
"https://pilbox.themuse.com/image.png?url=https%3A%2F%2Fassets.themuse.com%2Fuploaded%2Fattachments%2F24505.png%3Fv%3D09731259150f7d25a63520b56784baec24db96e73b92750a26df51ae5bf2ca8e&prog=1&w=780",
"https://sc04.alicdn.com/kf/H2aa36bd19d1d42838e88ada2f14288ccO.jpg",
"https://i.etsystatic.com/24456611/r/il/4830da/3474351438/il_fullxfull.3474351438_5yt8.jpg",
"https://www.niagarainstitute.com/hs-fs/hubfs/Quality%20means%20doing%20it%20right%20when%20no%20one%20is%20looking%20-%20Henry%20Ford%20Inspirational%20Quote%20for%20Employees.png?width=740&name=Quality%20means%20doing%20it%20right%20when%20no%20one%20is%20looking%20-%20Henry%20Ford%20Inspirational%20Quote%20for%20Employees.png",
"https://thumbs.dreamstime.com/b/motivational-inspirational-quotes-office-home-as-gift-222772745.jpg",
"https://rukminim1.flixcart.com/image/416/416/jgpfs7k0/poster/s/f/p/medium-gsp-021-all-i-ask-is-that-today-you-do-the-best-work-of-original-imaf4vqtnefqc3gy.jpeg?q=70"
);

?>
