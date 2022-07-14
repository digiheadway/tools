<?php include('function.php') ?>
<!DOCTYPE html>
<html>
<head>


  <style>
table, th, td {
    border: 1px solid black;
}
</style>
  </head>
<body>




<!--
id	
name	
date	
checkin_time	
checkin_ip	
checkin_loc	
checkout_time	
checkout_ip	
checkout_loc	
time_spent

-->$user = $_POST['user'];
setcookie('user', $user, time() + (86400 * 365), "/"); // 86400 = 1 day

<script src="script.js"></script>
</body>
</html>
