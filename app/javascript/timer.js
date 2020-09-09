window.addEventListener('load', function(){

  //勉強用タイマーの動作

  const start = document.getElementById("start")
  const stop = document.getElementById("stop")
  const reset = document.getElementById("reset")
  const sound = document.getElementById("sound")
  let min = document.getElementById("min").value
  let sec = document.getElementById("sec").value

  min = 50;
  sec = 0;
  document.timer.min.value = 50;
  document.timer.sec.value = 0;

  let timer1;
  let count = 0;

  const user = document.getElementById("user").innerHTML

  start.addEventListener('click', function cntStart(){
    timer1 = setInterval(countDown, 1000);
    stop.setAttribute("style", "display:inline;")
    this.setAttribute("style", "display:none;")
  })

  stop.addEventListener('click', function cntStop(){
    clearInterval(timer1);
    this.setAttribute("style", "display:none;")
    start.setAttribute("style", "display:inline;")
  })

  let countDown = function(){
    let min = document.getElementById("min").value
    let sec = document.getElementById("sec").value
    count = count + 1
    breakCntReset();
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
      alert("休憩しましょう！");
      studyTime();
      cntReset();
      break_timer_set();
    }else{
      document.timer.min.value = Math.floor(int / 60);
      document.timer.sec.value = int % 60;
    }
  }

  function cntReset(){
    document.timer.min.value = 0;
    document.timer.sec.value = 0;
    count = 0;
    stop.setAttribute("style", "display:none;")
    start.setAttribute("style", "display:inline;")
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

  // 休憩用タイマーの動作

  let timer2;

  function breakCntStart(){
    timer2 = setInterval(breakCountDown, 1000);
  }

  let breakCountDown = function(){
    let break_min = document.getElementById("break_min").value
    let break_sec = document.getElementById("break_sec").value
    if((break_min == "") && (break_sec == "")){
      alert("時間を設定してください！");
      reset();
    }else{
      if(break_min == ""){
        break_min = 0;
      }
      if(break_sec == ""){
        break_sec = 0;
      }
      breakSecWrite((break_min * 60) + (break_sec - 1));
    }
  }

  function breakSecWrite(int){
    if(int < 0){
      sound.play();
      alert("休憩時間終了です！");
      breakCntReset();
    }else{
      document.break_timer.break_min.value = Math.floor(int / 60);
      document.break_timer.break_sec.value = int % 60;
    }
  }

  function breakCntReset(){
    document.break_timer.break_min.value = 0;
    document.break_timer.break_sec.value = 0;
    break_start.setAttribute("style", "display:none;")
    break_stop.setAttribute("style", "display:inline;")
    clearInterval(timer2);
  }

  function break_timer_set(){
    const break_start = document.getElementById("break_start")
    const break_stop = document.getElementById("break_stop")
    const break_reset = document.getElementById("break_reset")

    break_min = 5;
    break_sec = 0;
    document.break_timer.break_min.value = 5;
    document.break_timer.break_sec.value = 0;

    breakCntStart();

    break_start.addEventListener('click', function breakCountStart(){
      timer2 = setInterval(breakCountDown, 1000);
      this.setAttribute("style", "display:none;")
      break_stop.setAttribute("style", "display:inline;")
    })

    break_stop.addEventListener('click', function breakCntStop(){
      clearInterval(timer2);
      this.setAttribute("style", "display:none;")
      break_start.setAttribute("style", "display:inline;")
    })
  }
})