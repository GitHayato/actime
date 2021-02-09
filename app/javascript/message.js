function sendMessage() {
  const submit = document.getElementById('submit');
  submit.addEventListener('click', (e) => {
    const formData = new FormData(document.getElementById('send-form'));
    const XHR = new XMLHttpRequest();
    const rootPath = location.pathname;
    XHR.open("POST", rootPath, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      } else if (XHR.readyState === XHR.DONE && XHR.status === 200) {
        const message = XHR.response.post;
        const list = document.getElementById("list");
        const formText = document.getElementById("send-input");
        const HTML =`
          <div class="message">
            <div class="information">
              <div class="message-info">
                <p class="info-user">${message.user_id}</p>
                <p class="info-date">${message.created_at}</p>
              </div>
              <ul class="navigation">
                <li><img src="/assets/three_point.png" class="menu-tag" resize="20*20">
                  <ul>
                    <li><a href="/rooms/${message.room_id}/messages/${message.id}" data-method="delete">削除</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <div class="message-content">
              ${message.content}
            </div>
          </div>`;
        list.insertAdjacentHTML("afterend", HTML);
        formText.value = "";
      };
    };
    e.preventDefault();
  });
}

window.addEventListener('load', sendMessage)