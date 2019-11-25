<?php
session_start();
$_SESSION = ['usuario'];
$varsession = $_SESSION['usuario'];
//conexion a la base de datos
$usuario = "root";
$contrasena = "utec";
$servidor = "localhost:3306";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

$consulta="SELECT * FROM USUARIO WHERE USUARIO_ID='$varsession';";
$resultado=mysqli_query($conexion, $consulta);

$indice = $resultado->fetch_row();
$id_usuario = $indice[0];
$nombre_usuario = $indice[1];
$apellidos_usuario = $indice[2];
$correo_usuario = $indice[3];
$fecha_nac_usuario = $indice[5];

mysqli_close($conexion);