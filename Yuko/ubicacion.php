<?php
    $usuario = "root";
    $contrasena = "utec";
    $servidor = "localhost:3306";
    $basededatos = "COSECHANDO";

    $conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
    $db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

    $coordenadas = $_POST['lol'];
    $usuario = "user0";
    $tama = "ldldlld";
            
    $consulta = "CALL Creacion_id_terreno('$coordenadas','$tama','$usuario');";
    $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala yuko");

    header("Location:main_user.html");

    mysqli_close( $conexion );
?>
  