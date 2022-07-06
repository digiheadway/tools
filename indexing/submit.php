<?php
$campaign = $_POST['cname'];
$urlget= $_POST['links'];
//$urlget= explode(' ', $urlget);


$urls = preg_split("/\r\n|\n|\r/", trim($urlget));


$apikey='96ee087a28efd0bf706dab8463c50128-431826235f68dc';
// All URLS to be sent are hold in an array for example

echo "Danywaad & ";

// build the POST query string and join the URLs array with | (single pipe)
$qstring='apikey='.$apikey.'&campaign='.$campaign.'&urls='.urlencode(implode('|',$urls));

// Do the API Request using CURL functions
$ch = curl_init();
curl_setopt($ch,CURLOPT_POST,1);
curl_setopt($ch,CURLOPT_URL,'http://www.indexification.com/api.php');
curl_setopt($ch,CURLOPT_HEADER,0);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch,CURLOPT_TIMEOUT,40);
curl_setopt($ch,CURLOPT_POSTFIELDS,$qstring);
var_export(curl_exec($ch));
curl_close($ch);

echo "+ Ho Jayengi Saari Index - Satbir Master ki awaz main.";
?>
 