<?php
$host = "localhost";
$user = "u240376517_tools";
$password = "#DNhomg$:p7L";
$database = "staff_panel";
$filepath = "backup.sql";

// exec("mysqldump --user=$user --password=$password --host=$host  $database  < $targetFifilepathlePath");
exec("mysql --user=$user -password=$password -host=$host $database < $filepath");

// mysql -u [user] -p [database_name] < [filename].sql
?> 