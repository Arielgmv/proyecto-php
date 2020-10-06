<?php
if (isset($_POST)) {
    //Conexión a la base de datos
    require_once 'includes/conexion.php';

    $titulo = isset($_POST['titulo']) ? mysqli_real_escape_string($db, $_POST['titulo']) : false;
    $descripcion = isset($_POST['descripcion']) ? mysqli_real_escape_string($db, $_POST['descripcion']) : false;
    $categoria = isset($_POST['categoria']) ? (int)$_POST['categoria'] : false;
    $usuario = $_SESSION['usuario']['id'];

    //Array de errores
    $errores = array();
    
    //Validar los datos antes de guardarlos en la BBDD
    
    if (empty($titulo)) {
        $errores['titulo'] = "El titulo no es válido";
    }

    if (empty($descripcion)) {
        $errores['descripcion'] = "La descripcion no es válida";
    }

    if (empty($categoria) && !is_numeric($categoria)) {
        $errores['categoria'] = "La categoria no es válida";
    }

    /*echo('<pre>');
    var_dump($errores);        
    die();*/
    
    if (count($errores) == 0) {
        $sql = "INSERT INTO entradas VALUES(null, $usuario, $categoria, '$titulo', '$descripcion', CURDATE());";
        $guardar = mysqli_query($db, $sql);

        /*echo('<pre>');
        var_dump(mysqli_error($db));        
        die();*/

    }else {
        $_SESSION["errores_entrada"] = $errores;
    }
}
header('Location: index.php');