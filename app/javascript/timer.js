window.addEventListener('load', function(){
  const start = document.getElementById("start")
  const stop = document.getElementById("stop")
  const reset = document.getElementById("reset")
  const sound = document.getElementById("sound")
  let timer1;
  let count = 0;

  const user = document.getElementById("user").innerHTML

  start.addEventListener('click', function cntStart(){
    timer1 = setInterval(countDown, 1000);
  })

  stop.addEventListener('click', function cntStop(){
    clearInterval(timer1);
  })

  reset.addEventListener('click', function(){
    cntReset();
  })

  let countDown = function(){
    let min = document.getElementById("min").value
    let sec = document.getElementById("sec").value
    count = count + 1
    if((min == "") && (sec == "")){
      alert("時間を設定してください！");
      reset();
    }else{
      if(min == ""){
        min = 0;
      }
      if(sec == ""){
        sec = 0;
      }
      secWrite((min * 60) + (sec - 1));
    }
  }

  function secWrite(int){
    if(int < 0){
      sound.play();
      alert("時間です！");
      studyTime();
      cntReset();
    }else{
      document.timer.min.value = Math.floor(int / 60);
      document.timer.sec.value = int % 60;
    }
  }

  function cntReset(){
    document.timer.min.value = 0;
    document.timer.sec.value = 0;
    count = 0;
    clearInterval(timer1);
  }

  function studyTime(){

    let day = new Date();
    const year = day.getFullYear();
    const month = day.getMonth() + 1;
    const date = day.getDate();
    day = year + "-" + month + "-" + date;

    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/users/${user}/time_managements`, true);
    XHR.setRequestHeader('content-type', 'application/x-www-form-urlencoded;charset=UTF-8');
    XHR.send([day,count]);
  }
})