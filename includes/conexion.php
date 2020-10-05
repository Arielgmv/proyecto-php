 <?php
 //Conexion
 $servidor = 'localhost';
 $usuario  = 'root';
 $password = '12345678'; 
 $basededatos = 'blog_master';
 $db = mysqli_connect($servidor, $usuario, $password, $basededatos);

 mysqli_query($db, "SET NAMES 'utf8'");//si viene alguna información de la BBDD
 //con ñ o tildes que funcione correctamente

 //Iniciar la sesión
 if (!isset($_SESSION)) {
    session_start();
 }