<?php
//Iniciar la sesión y la conexión a la BBD
require_once 'includes/conexion.php';

//Recoger los datos del formulario
if (isset($_POST)) {
    $email = trim($_POST['email']);
    $password = $_POST['password'];
}

//Comprobar la contraseña

//Consulta para comprobar las credenciales del usuario

//Utilizar una sesión para guardar los datos del usuario logueado


//Si algo falla, enviar una sesión con el fallo

//Redirigir al index.php