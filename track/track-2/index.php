<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance</title>
    <style>
            body{
  text-align: center; 
}



button{
  position: relative;
  border: none;
  outline:none;
  cursor: pointer;
  background: #89669b;
  color: white;
  padding: 18px 60px;
  border-radius: 2px;
  font-size: 22px;
}

.fab{
  border-radius: 50%;
  margin:0;
  padding: 20px;
}

.material{
  position:relative;
  color:white;
  margin: 20px auto;
  height:400px;
  width:500px;
  background:#f45673;
  
}

.ripple{
  overflow:hidden;
}

.ripple-effect{
  position: absolute;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  background: white;

    
  animation: ripple-animation 2s;
}


@keyframes ripple-animation {
    from {
      transform: scale(1);
      opacity: 0.4;
    }
    to {
      transform: scale(100);
      opacity: 0;
    }
}
    </style>

<script>
function setCookie(cname,cvalue,exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  let expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function checkCookie() {
  let user = getCookie("user");
  if (user != "") {
  //  alert("Welcome again " + user);
  } else {
     user = prompt("Please enter your name:","");
     if (user != "" && user != null) {
       setCookie("user", user, 30);
       location.reload();

     }
  }
}
</script>
</head>
<body onload="checkCookie()">
    
<h1 id="welcome">Hello <?php echo $_COOKIE['user']; ?></h1>
<h3>Admins will be notifed</h3>

<a href="come.php" target="_blank"><button class="ripple" id="coming">Comming in</button></a>
<a href="going.php" target="_blank"><button class="ripple" data-ripple-color="#89669b" style="background:white; color:black;">Going Out</button></a>

</body>

<script>
    (function (window, $) {
  
  $(function() {
    
    
    $('.ripple').on('click', function (event) {
      event.preventDefault();
      
      var $div = $('<div/>'),
          btnOffset = $(this).offset(),
      		xPos = event.pageX - btnOffset.left,
      		yPos = event.pageY - btnOffset.top;
      

      
      $div.addClass('ripple-effect');
      var $ripple = $(".ripple-effect");
      
      $ripple.css("height", $(this).height());
      $ripple.css("width", $(this).height());
      $div
        .css({
          top: yPos - ($ripple.height()/2),
          left: xPos - ($ripple.width()/2),
          background: $(this).data("ripple-color")
        }) 
        .appendTo($(this));

      window.setTimeout(function(){
        $div.remove();
      }, 2000);
    });
    
  });
  
})(window, jQuery);
</script>
</html>