<?php
    session_start();
    $varsession = $_SESSION['registro'];
    $correo = $varsession;
    $coordenadas = $_POST['lol'];
    $tama = "ldldlld";
    
    if($varsession == null || $varsession = ''){
        echo 'No tienes autorización para estar aquí insecto';
        die();
    }

    $usuario = "root";
    $contrasena = "utec";
    $servidor = "localhost:3306";
    $basededatos = "COSECHANDO";

    $conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
    $db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );
            
    $consulta = "CALL Creacion_id_terreno('$coordenadas','$tama','$correo')";
    $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala yuko");

    header("Location:../log_in.html");

    mysqli_close( $conexion );
?>
  