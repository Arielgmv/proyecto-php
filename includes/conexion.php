 <?php
 //Conexion
 $servidor = 'localhost';
 $usuario  = 'root';
 $password = '12345678';
 //$password = '1234567';
 $basededatos = 'blog_master';
 $db = mysqli_connect($servidor, $usuario, $password, $basededatos);

 mysqli_query($db, "SET NAMES 'utf8'");//si viene alguna información de la BBDD
 //con ñ o tildes que funcione correctamente

 //Iniciar la sesión
 session_start();