<?php
$host = "localhost";
$user = "u240376517_testing";
$password = "8W=qnEP#u";
$database = "u240376517_testing";
$file1 = "wo_trigger.sql";
$file2 = "w_trigger.sql";

exec("mysqldump --user=$user --password=$password --host=$host  $database  < $file1");
exec("mysqldump --user=$user --password=$password --host=$host  $database  < $file2");
// exec("mysql --user=$user --password=$password -host=$host $database < $filepath");
// exec("mysqlimport --user $user --password $password --host $host $database $filepath");

// mysql -u [user] -p [database_name] < [filename].sql
?> 