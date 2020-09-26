<?php
if (isset($_POST)) {
    //Conexión a la base de datos
    require_once 'includes/conexion.php';
    //Iniciar sesión
    if (!isset($_SESSION)) {
        session_start();
    }    
    //Recoger los valores del formulario de registro
    //mysqli_real_escape_string->escapa los caracteres especiales, no interpretar como parte de SQL, se toma en cuenta como si fuera un string
    $nombre = isset($_POST['nombre']) ? mysqli_real_escape_string($db, $_POST['nombre']) : false;
    $apellidos = isset($_POST['apellidos']) ? mysqli_real_escape_string($db, $_POST['apellidos']) : false;
    $email = isset($_POST['email']) ? mysqli_real_escape_string($db, trim($_POST['email'])) : false;
    $password = isset($_POST['password']) ? mysqli_real_escape_string($db, $_POST['password']) : false;

    //Array de errores
    $errores = array();
    
    //Validar los datos antes de guardarlos en la BBDD
    //Validar campo nombre
    if (!empty($nombre) && !is_numeric($nombre) && !preg_match("/[0-9]/", $nombre)) {
        $nombre_validado = true;
    } else {
        $nombre_validado = false;
        $errores['nombre'] = "El nombre no es válido";
    }
    //Validar campo apellidos
    if (!empty($apellidos) && !is_numeric($apellidos) && !preg_match("/[0-9]/", $apellidos)) {
        $apellidos_validado = true;
    } else {
        $apellidos_validado = false;
        $errores['apellidos'] = "El apellido no es válido";
    }
    //Validar campo email
    if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $email_validado = true;
    } else {
        $email_validado = false;
        $errores['email'] = "El email no es válido";
    }
    //Validar campo password
    if (!empty($password)) {
        $password_validado = true;
    } else {
        $password_validado = false;
        $errores['password'] = "La contraseña está vacia";
    }
    
    $guardar_usuario = false;
    if (count($errores)==0) {
        $guardar_usuario = true;
        //Cifrar la contraseña
        $password_segura = password_hash($password, PASSWORD_BCRYPT, ['cost'=>4]);
        /*echo('<pre>');
        var_dump($password);
        var_dump($password_segura);
        var_dump(password_verify('password', $password_segura));
        die();*/

        //Insertar usuario en la tabla usuarios de la BBDD
        $sql = "INSERT INTO usuarios VALUES(null, '$nombre', '$apellidos', '$email', '$password_segura', CURDATE());";
        $guardar = mysqli_query($db, $sql);
        
        /*echo('<pre>');
        var_dump(mysqli_error($db));
        var_dump(mysqli_connect_error($db));
        var_dump(mysqli_connect_errno($db));
        die();*/
        
        if ($guardar) {
            $_SESSION['completado'] = "El registro se ha completado con exito";
        } else {
            $_SESSION['errores']['general'] = "Fallo al guardar el usuario!!!   ";
        }
    } else {
        $_SESSION['errores'] = $errores;        
    }
    header('Location: index.php');
}