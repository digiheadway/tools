<?php 
$user = $_GET['user'];
setcookie('user', $user, time() + (86400 * 365), "/"); // 86400 = 1 day

$user = $_COOKIES['user'];
if($user){
    header("Location: index.php");
die();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to System</title>
</head>
<body>
<form action="index.php" method="get">
Name: <input type="text" name="user"><br>
<input type="submit">
</form>
</body>
</html>