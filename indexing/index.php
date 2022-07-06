<?php
$apikey='96ee087a28efd0bf706dab8463c50128-431826235f68dc';

// build the POST query string
$qstring='apikey='.$apikey.'&remaininglimit=1';

// Do the API Request using CURL functions
$ch = curl_init();
curl_setopt($ch,CURLOPT_POST,1);
curl_setopt($ch,CURLOPT_URL,'http://www.indexification.com/api.php');
curl_setopt($ch,CURLOPT_HEADER,0);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch,CURLOPT_TIMEOUT,40);
curl_setopt($ch,CURLOPT_POSTFIELDS,$qstring);
$response=curl_exec($ch);
curl_close($ch);

?>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<h2>Index Your Links</h2>
<p>Credit Left : <? echo $response; ?></p>

<div class="container">
  <form action="submit.php" method="post">
    <div class="row">
      <div class="col-25">
        <label for="cname">Campaign Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="cname" name="cname" placeholder="Your name..">
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="links">Links</label>
      </div>
      <div class="col-75">
        <textarea id="links" name="links" placeholder="Put links.." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>

</body>
</html>
