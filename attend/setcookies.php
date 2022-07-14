<?php 

$user = $_GET['user'];

if($user){
    setcookie("user", $user, time() + (86400 * 365), "/"); // 86400 = 1 day
 //   header('Location: index.php');
}else{
    echo "No User Info Found";
}
?>