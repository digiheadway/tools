<?php

// Get data from webhook
$json = file_get_contents('php://input');

if (!$json) {
  echo "No Data"
  die();
}
// Decode JSON data to PHP associative array
$arr = json_decode($json, true);

// Decode JSON data to PHP object
$obj = json_decode($json);
 
// echo $obj->name;
$postData = [ 
    "cust_id" => $obj->cust_id,
    "name" => $obj->name,
    "email" => $obj->email,
    "mobile" => $obj->mobile,
    "source" => "AskNavigator",
    "company" => "AskNavigator",
    "fromcity" => $obj->pickup_city,
    "rel-date" =>  $obj->relocation_date,
    "leadCreatedAt" =>  $obj->verified_at,
    "leadUpdatedAt" =>  $obj->verified_at
];


$curl = curl_init();

curl_setopt_array($curl, array(
//  CURLOPT_URL => 'https://staging.happylocate.org/api/v1/user/lead',
  CURLOPT_URL => 'https://webhook.site/ffcbfda0-ede3-4548-b815-e6be05b11317',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS => json_encode($postData),
  CURLOPT_HTTPHEADER => array(
    'api-key: ciw7b5c2ovvupwpdnmuqwtnivlqsbny6doyqkbds',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


?>