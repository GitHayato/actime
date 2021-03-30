// 非同期で種目や距離を更新
function updateAsynchronous(key, dataNow) {
  dataNow.addEventListener('change', () => {
    const formData = new FormData();
    const XHR = new XMLHttpRequest();
    formData.append(key, dataNow.value);
    const watchId = dataNow.closest("tr").id;
    const url = location.pathname;
    const pathParameter = url.split("/");
    XHR.open("PATCH", `/rooms/${pathParameter[2]}/watches/${watchId}`, true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
}

function updateUsername() {
  const dataUsername = document.getElementsByClassName("data-username")
  let count = 0;
  for (let i = 0; i<=dataUsername.length-1; i++) {
    const dataUsernameNow = dataUsername[count];
    updateAsynchronous("user_id", dataUsernameNow);
    count++;
  }
}

export function updateEvent() {
  const dataEvent = document.getElementsByClassName("data-event");
  let count = 0;
  for (let i = 0; i<=dataEvent.length-1; i++) {
    const dataEventNow = dataEvent[count];
    updateAsynchronous("event_id", dataEventNow);
    count++;
  }
}

export function updateDistance() {
  const dataDistance = document.getElementsByClassName("data-distance")
  let count = 0;
  for (let i = 0; i<=dataDistance.length-1; i++) {
    const dataDistanceNow = dataDistance[count];
    updateAsynchronous("distance_id", dataDistanceNow);
    count++;
  }
} 

window.addEventListener('load', updateUsername)
window.addEventListener('load', updateEvent)
window.addEventListener('load', updateDistance)