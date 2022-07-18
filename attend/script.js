var x = document.getElementById("demo");

getLocation();

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML =
    "Latitude: " +
    position.coords.latitude +
    "<br>Longitude: " +
    position.coords.longitude;
}

async function checkIn() {
  console.log(`Check in`);
  let result = await request({
    action: "checkIn",
  });
  console.log(result);
}

async function checkOut(id) {
  console.log(`Check out: ${id}`);
  navigator.geolocation.getCurrentPosition(async function (position) {
    let result = await request({
      action: "checkOut",
      id: id,
      lat: position.coords.latitude,
      lon: position.coords.longitude,
    });
    console.log(result);
  });
}

async function request(data) {
  let result = await fetch("checking.php", {
    method: "POST",
    body: JSON.stringify($data),
  });

  let response = await result.json();
  return response;
}
