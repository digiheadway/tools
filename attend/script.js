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

let pos = {
  lat: 0,
  lon: 0,
};

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition((position) => {
    pos.lat = position.coords.latitude;
    pos.lon = position.coords.longitude;
  });
}

async function checkOut(id) {
  console.log(`Check out: ${id}`);
  let result = await request({
    action: "checkOut",
    id: id,
    lat: pos.lat,
    lon: pos.lon,
  });
  console.log(result);
}

async function request(data) {
  let result = await fetch("checkings.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });

  let response = await result.text();
  return response;
}
