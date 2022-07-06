<?php  
date_default_timezone_set('Asia/Kolkata');

$user=$_COOKIE['user'];

if(!$user){
    echo "No User Info";
    exit();
}

$time= date("d%20M%20h:i:s%20a", time());

$ip= $_SERVER['REMOTE_ADDR'];  

$msg= $user."%20is%20Checking%20*out*%20from%20office%20at%20".$time."%20With%20IP%20".$ip ;

$url="https://wa.digiheadway.com/?msg=New&pn=9068062563,9050995106&msg=".$msg;
  
$ch = curl_init();   
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);   
curl_setopt($ch, CURLOPT_URL, $url);   
$res = curl_exec($ch);   
// echo $res;  
echo "Notified";   

?>  

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="refresh" content="2;URL='https://api.whatsapp.com/send?phone=919068062563&text=Today+I+have+done'" />    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>