function stopWatch() {
  const time = document.getElementById("time");
  const start = document.getElementById("start");
  const rap = document.getElementById("rap");

  function nowTime() {
    // 呼び出されたときにid="time"のHTMLテキストを現在時刻に書き換え
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const milliSeconds = String(now.getMilliseconds()).padStart(3, '0');
    time.innerHTML = `${hours}:${minutes}:${seconds}.${milliSeconds}`;

  }

  function stopWatchInitial() {
    // id="rap"ボタンののHTMLからinactiveというclassを除く
    rap.classList.add("inactive");
  }

  function stopWatchRun() {
    // id="rap"のHTMLにinactiveというclassをつける
    rap.classList.remove("inactive");
  }

  // 初期状態で関数stopWatchInitialを呼び出す
  stopWatchInitial();
  

}




document.addEventListener('DOMContentLoaded', stopWatch)
