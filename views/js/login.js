const btn = document.getElementById("btn")
function login(){
  email = document.getElementById("correo").value
  pass  = document.getElementById("clave").value

	if (email!= ("correo")){
		alert("Usted no está registrado")
    return false
	}
  if (pass!= ("clave")) {
    alert("Contraseña Incorrecta")
    return false
  }
  alert("Bienvenido")
  window.location.href="/home"
}
btn.addEventListener("click", login)