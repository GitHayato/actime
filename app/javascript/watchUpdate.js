// 非同期で名前や種目、距離を更新
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

export function updateDetails(className, id) {
  const data = document.getElementsByClassName(className)
  let count = 0;
  for (let i = 0; i<=data.length-1; i++) {
    const dataNow = data[count];
    updateAsynchronous(id, dataNow);
    count++;
  }
}

window.addEventListener('load', function() {
  updateDetails("data-username", "user_id")
});
window.addEventListener('load', function() {
  updateDetails("data-event", "event_id")
});
window.addEventListener('load', function() {
  updateDetails("data-distance", "distance_id")
});