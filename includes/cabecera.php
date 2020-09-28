<?php require_once 'conexion.php'; ?>
<?php require_once 'includes/helpers.php'; ?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Blog de Videojuegos</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css">
</head>

<body>
    <!--Cabecera-->
    <header id="cabecera">
        <!--Logo-->
        <div id="logo">
            <a href="index.php">
                Blog de Videojuegos
            </a>
        </div>
        <!--Menu-->
        <nav id="menu">
            <ul>
                <li>
                    <a href="index.php">Inicio</a>
                </li>
                <?php
                    $categorias = conseguirCategorias($db);
                    while($categoria = mysqli_fetch_assoc($categorias)):
                ?>
                    <li>
                        <a href="categoria.php?id=<?=$categoria['id']?>"><?=$categoria['nombre']?></a>
                    </li>
                <?php endwhile; ?>
                <li>
                    <a href="index.php">Sobre Nosotros</a>
                </li>
                <li>
                    <a href="index.php">Contacto</a>
                </li>
            </ul>
        </nav>
        <div class="clearfix"></div>
    </header>

    <div id="contenedor">