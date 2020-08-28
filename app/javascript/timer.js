window.addEventListener('load', function(){
  const start = document.getElementById("start")
  const stop = document.getElementById("stop")
  // const sound = document.getElementById("sound")

  let timer1;
  
  start.addEventListener('click', function cntStart(){
    timer1 = setInterval(countDown, 1000);
  })

  stop.addEventListener('click', function cntStop(){
    clearInterval(timer1);
  })

  let countDown = function(){
    let min = document.getElementById("min").value
    let sec = document.getElementById("sec").value

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
      reset();
      // sound.play();
      alert("時間です！");
    }else{
      document.timer.min.value = Math.floor(int / 60);
      document.timer.sec.value = int % 60;
    }
  }

  function reset(){
    document.timer.min.value = 0;
    document.timer.sec.value = 0;
    clearInterval(timer1);
  }
})