import {updateDetails} from './watchUpdate'

// ラップを非同期で保存し一覧表示
export function addLap() {
  const moment = require("moment");
  const time = document.getElementById("time").innerHTML;
  const formData = new FormData();
  formData.append("watch", time);
  const XHR = new XMLHttpRequest();
  const url = location.pathname
  const pathParameter = url.split("/")
  XHR.open("POST", `/rooms/${pathParameter[2]}/watches`, true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    } else if (XHR.readyState === XHR.DONE && XHR.status === 200) {
      const content = XHR.response.watch;
      const users = XHR.response.users;
      const events = XHR.response.events;
      const distances = XHR.response.distances;
      const table = document.getElementById("time-table");
      const createMoment = moment(content.created_at, 'YYYY-MM-DD-T-HH:mm:ssZ')
      const createTime = createMoment.format('YYYY/MM/DD')
      const HTML = `
        <tr id=${content.id}>
          <td class="date">${createTime}</td>
          <td class="time">${content.watch}</td>
          <td class="name">
            <select class="data-pulldown data-username" name="user_id" id="user_id">
              <option value>-----</option>
              ${dataLoop(users, "username")}
            </select>
          </td>
          <td class="event">
            <select class="data-pulldown data-event" name="event_id" id="event_id">
              <option value>-----</option>
              ${dataLoop(events, "event")}
            </select>
          </td>
          <td class="distance">
            <select class="data-pulldown data-distance" name="distance_id" id="distance_id">
              <option value>-----</option>
              ${dataLoop(distances, "distance")}
            </select>
          </td>
        </tr>`;
      table.insertAdjacentHTML("afterbegin", HTML);
      updateDetails("data-username", "user_id");
      updateDetails("data-event", "event_id");
      updateDetails("data-distance", "distance_id");
    }
  };
}

function dataLoop(data, params) {
  const dataHtml = [];
  data.forEach((element) => {
    dataHtml.push(`<option value="${element['id']}">${element[params]}</option>`);
  });
  return dataHtml.join('\n')
}
