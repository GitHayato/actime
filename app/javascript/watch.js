import {addLap} from './addLap'

function stopWatch() {
  const time = document.getElementById("time");
  const start = document.getElementById("start");
  const lap = document.getElementById("lap");
  const japanStandardTime = 32400000
  
  let timerId;
  let startTime;
  let stoppingTime = 0;

  const nowTime = () => {
    // 呼び出されたときにid="time"のHTMLテキストを10ミリ秒間隔で更新
    const now = new Date(Date.now() - startTime + stoppingTime - japanStandardTime);
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const milliSeconds = String(now.getMilliseconds()).padStart(3, '0');
    time.innerHTML = `${hours}:${minutes}:${seconds}.${milliSeconds}`;

    timerId = setTimeout(nowTime, 10);
  }
  
  // 即時関数を定義して初期状態で呼び出し
  function stopWatchInitial() {
    // id="lap"ボタンののHTMLからinactiveというclassを除く
    lap.classList.add("inactive");
  };
  
  function stopWatchRun() {
    // id="lap"のHTMLにinactiveというclassをつける
    lap.classList.remove("inactive");
  };
  
  // この時点で呼び出すことで初期状態で呼び出されている状態になる
  stopWatchInitial()
  
  // id="start"ボタンがクリックされたときの挙動
  start.addEventListener('click', (e) => {
    // inputタグのvalue属性が"START"のときの挙動
    if (start.value == 'START') {
      // ボタンの表示変更
      start.value = 'STOP';
      lap.value = 'LAP';
      stopWatchRun(); 
      startTime = new Date();
      nowTime();
      e.preventDefault();

    // inputタグのvalue属性が"STOP"のときの挙動
    } else if (start.value == 'STOP') {
      start.value = 'START';
      lap.value = 'RESET';
      clearTimeout(timerId)
      stoppingTime += Date.now() - startTime;
      e.preventDefault();
    }
  });
  
  // id="lap"のボタンがクリックされたときの挙動
  lap.addEventListener('click', (e) => {
    // inputタグのvalue属性が"RESET"のときの挙動
    if (lap.value == 'RESET') {
      lap.value = 'LAP';
      stopWatchInitial();
      stoppingTime = 0;
      time.innerHTML = "00:00:00.000";
      e.preventDefault();

    // inputタグのvalue属性が"lap"のときの挙動
    } else if (lap.classList.contains("inactive")) {
      return null;
    } else if (lap.value == 'LAP') {
      addLap();
      e.preventDefault();
    }
  });
}

window.addEventListener('load', stopWatch)