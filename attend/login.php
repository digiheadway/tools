<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to System</title>
    <style>
        html {
    box-sizing: border-box;
  }

  *,
  *:before,
  *:after {
      box-sizing: inherit;
  }

  body {
    font-family: "Trebuchet MS", "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Tahoma, sans-serif;
    background-color: #ECEFF1;
  }
  form {
    max-width: 300px;
    margin-top: 60px;
    margin-right: auto;
    margin-left: auto;
    text-align: left;
    position: relative;
    padding-top: 80px;
  }
  label,
  input {
      display: block;
  }
  label {
    font-size: 12px;
    text-transform: uppercase;
    color: #B0BEC5;
    margin-bottom: 10px;
  }
  input {
      width: 100%;
      padding: 10px;
      outline: 0;
      border: 2px solid #B0BEC5;
      margin-top: 10px;
  }
  input.invalid {
      border-color: #DD2C00;
  }

  #notify {
    margin-top: 5px;
    padding: 10px;
    font-size: 12px;
    width: 100%;
    color: #fff;
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
  }
  #notify.error {
    background-color: #DD2C00;
  }
    </style>
</head>
<body>
<form id="form" action="setcookies.php" method="get">
  <div>
    <p>eg. vinaysharma</p>
   <!-- <label for="username">Username</label> -->
    <input name="username" type="text" placeholder="Username" pattern="[a-z]{1,15}" id="username">
    <input type="submit">
  </div>
</form>
<script>
    (function() {
  
  var input              = document.getElementById('username');
  var form               = document.getElementById('form');
  var elem               = document.createElement('div');
      elem.id            = 'notify';
      elem.style.display = 'none';

      form.appendChild(elem);

  input.addEventListener('invalid', function(event){
    event.preventDefault();
    if ( ! event.target.validity.valid ) {
      input.className    = 'invalid animated shake';
      elem.textContent   = 'Username should only contain lowercase letters e.g. john';
      elem.className     = 'error';
      elem.style.display = 'block';
    }
  });

  input.addEventListener('input', function(event){
    if ( 'block' === elem.style.display ) {
      input.className = '';
      elem.style.display = 'none';
    }
  });

})();
</script>
</body>
</html>

