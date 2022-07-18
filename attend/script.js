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

function checkIn() {
  console.log(`Check in`);
  console.log(await request({
    "action": "checkIn"
  }))
}

function checkOut(id) {
  console.log(`Check out: ${id}`);
  navigator.geolocation.getCurrentPosition(position => {
    console.log(await request({
      "action": "checkOut",
      "id": id,
      "lat": position.coords.latitude,
      "lon": position.coords.longitude,
    }));
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
