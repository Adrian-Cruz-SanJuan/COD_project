<?php
    session_start();
    $varsession = $_SESSION['registro'];
    echo $_SESSION['registro'];

    if($varsession == null || $varsession = ''){
        echo 'No tienes autorización para estar aquí insecto';
        die();
    }
    echo $_SESSION['usuario'];

    $usuario = "root";
    $contrasena = "utec";
    $servidor = "localhost:3306";
    $basededatos = "COSECHANDO";

    $conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
    $db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

    $consulta1 = "SELECT USUARIO_ID FROM USUARIO WHERE CORREO_U = '$varsession';";
    $resultado1 = mysqli_query( $conexion, $consulta1 ) or die ( "Algo ha ido mal en la consulta verificala yuko");
    //Obtener el id 
    $indice = $resultado1->fetch_row();
    $id_usuario = $indice[0];

    $coordenadas = $_POST['lol'];
    $usuario = $id_usuario;
    $tama = "ldldlld";
            
    $consulta = "CALL Creacion_id_terreno('$coordenadas','$tama','$usuario');";
    $resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala yuko");

    //header("Location:log_in.html");

    mysqli_close( $conexion );
?>
  