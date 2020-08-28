window.addEventListener('load', function(){
  const confirm_deletion = document.getElementById("confirm_deletion")
  const problem_delete = document.getElementById("problem_delete")
  const quit = document.getElementById("quit")

  confirm_deletion.addEventListener('click', function (){
    problem_delete.setAttribute("style", "display:block;")
  })

  quit.addEventListener('click', function (){
    problem_delete.setAttribute("style", "hidden")
  })
})