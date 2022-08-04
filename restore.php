<?php
$host = "localhost";
$user = "u240376517_tools";
$password = "#DNhomg$:p7L";
$database = "staff_panel";
$filepath = "backup.sql";

exec("mysqldump --user=$user --password=$password --host=$host  $database  < $filepath");
// exec("mysql --user=$user --password=$password -host=$host $database < $filepath");
// exec("mysqlimport --user $user --password $password --host $host $database $filepath");

// mysql -u [user] -p [database_name] < [filename].sql
?> 