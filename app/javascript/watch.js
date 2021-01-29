function stopWatch() {
  const time = document.getElementById("time");
  const start = document.getElementById("start");
  const rap = document.getElementById("rap");
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
    // id="rap"ボタンののHTMLからinactiveというclassを除く
    rap.classList.add("inactive");
  };

  function stopWatchRun() {
    // id="rap"のHTMLにinactiveというclassをつける
    rap.classList.remove("inactive");
  };

  // この時点で呼び出すことで初期状態で呼び出されている状態になる
  stopWatchInitial();

  // id="start"ボタンがクリックされたときの挙動
  start.addEventListener('click', function() {
    // inputタグのvalue属性が"START"のときの挙動
    if (start.value == 'START') {
      // ボタンの表示変更
      start.value = 'STOP';
      rap.value = 'RAP';
      stopWatchRun();
      // 
      startTime = new Date();
      nowTime()

    // inputタグのvalue属性が"STOP"のときの挙動
    } else if (start.value == 'STOP') {
      start.value = 'START';
      rap.value = 'RESET';
      clearTimeout(timerId)
      stoppingTime += Date.now() - startTime;
    }
  });
  
  // id="rap"のボタンがクリックされたときの挙動
  rap.addEventListener('click', function() {
    // inputタグのvalue属性が"RESET"のときの挙動
    if (rap.value == 'RESET') {
      rap.value = 'RAP';
      stopWatchInitial();
      time.innerHTML = "00:00:00.000";

    // inputタグのvalue属性が"RAP"のときの挙動
    } else if (rap.value == 'RAP') {
      // ラップタイムをtableに追加していく
    }
  });
}




document.addEventListener('DOMContentLoaded', stopWatch)
