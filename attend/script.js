let locationDiv = document.querySelector("#location");
let timeDiv = document.querySelector("#timer");

setInterval(() => {
  timeDiv.textContent = new Date().toTimeString().split(" ")[0];
}, 1000);

let pos = {
  lat: 0,
  lon: 0,
};

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition((position) => {
    pos.lat = position.coords.latitude;
    pos.lon = position.coords.longitude;
    locationDiv.textContent = `(${pos.lat}, ${pos.lon})`;
  });
}

async function checkIn() {
  processdone();
  console.log(`Check in`);
  let result = await request({ action: "checkIn" });
  console.log(result);
}

async function checkOut(id) {
  processdone();
  console.log(`Check out: ${id}`);
  let result = await request({ action: "checkOut", id: id });
  console.log(result);
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
    let hours = padNumber(diff_in_sec / (60 * 60));
    let minutes = padNumber((diff_in_sec / 60) % 60);
    let seconds = padNumber(diff_in_sec % 60);

    sessionTimeDiv.textContent = `Session time: ${hours}:${minutes}:${seconds}`;
  }, 1000);
}

function padNumber(float) {
  return parseInt(float).toString().padStart(2, 0);
}
function processdone(){
  document.getElementById('loader').style.display = 'block';
  document.getElementById('container').style.display = 'none';
}
