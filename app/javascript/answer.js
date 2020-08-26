window.addEventListener('load', function(){
  const see_answer = document.getElementById("see_answer")
  const feedback = document.getElementById("feedback")
  see_answer.addEventListener('click', function (){
    feedback.setAttribute("style", "display:block;")
  })
})