<?php

$data = json_decode(trim(file_get_contents("php://input")), true);

echo json_encode($data);

?>