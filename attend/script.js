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

async function checkIn() {
  console.log(`Check in`);
  let result = await request({ action: "checkIn" });
  console.log(result);
  location.reload();
}

async function checkOut(id) {
  console.log(`Check out: ${id}`);
  let result = await request({ action: "checkOut", id: id });
  console.log(result);
  location.reload();
}

async function request(data) {
  data.lat = pos.lat;
  data.lon = pos.lon;
  let result = await fetch("checkings.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });

  let response = await result.json();
  return response;
}

let sessionTimeDiv = document.querySelector("#session_timing");
if (sessionTimeDiv) {
  let checkInTime = sessionTimeDiv.dataset.time;
  setInterval(function () {
    let diff_in_sec = (new Date() - new Date(checkInTime)) / 1000;
    let hours = parseInt(diff_in_sec / (60 * 60))
      .toString()
      .padStart(2, 0);
    let minutes = parseInt((diff_in_sec / 60) % 60)
      .toString()
      .padStart(2, 0);
    let seconds = parseInt(diff_in_sec % 60)
      .toString()
      .padStart(2, 0);
    sessionTimeDiv.textContent = `Session time: ${hours}:${minutes}:${seconds}`;
  }, 1000);
}
