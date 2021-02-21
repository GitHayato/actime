function updateAsynchronous(key, dataNow) {
  dataNow.addEventListener('change', () => {
    const formData = new FormData();
    const XHR = new XMLHttpRequest();
    const moment = require("moment");
    formData.append(key, dataNow.value);
    const watchId = dataNow.closest("tr").id;
    const url = location.pathname;
    const pathParameter = url.split("/");
    XHR.open("PATCH", `/rooms/${pathParameter[2]}/watches/${watchId}`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      } else {
        const content = XHR.response.watch;
        const createMoment = moment(content.updated_at, 'YYYY-MM-DD-T-HH:mm:ssZ')
        const createTime = createMoment.format('YYYY/MM/DD')
        const HTML = `
          <tr id=${content.id}>
            <td class="date">${createTime}</td>
            <td class="time">${content.watch}</td>
            <td class="name">admin</td>
            <td class="event">${content.event}</td>
            <td class="distance">${content.distance}</td>
          </tr>`;
        dataNow.insertAdjacentHTML("afterbegin", HTML);
      }
    }
  });
}

function updateEvent() {
  const dataEvent = document.getElementsByClassName("data-event");
  let count = 0;
  for (let i = 0; i<=dataEvent.length-1; i++) {
    const dataEventNow = dataEvent[count];
    updateAsynchronous("event", dataEventNow);
    count++;
  }
}

function updateDistance() {
  const dataDistance = document.getElementsByClassName("data-distance")
  let count = 0;
  for (let i = 0; i<=dataDistance.length-1; i++) {
    const dataDistanceNow = dataDistance[count];
    updateAsynchronous("distance", dataDistanceNow);
    count++;
  }
} 

window.addEventListener('load', updateEvent)
window.addEventListener('load', updateDistance)