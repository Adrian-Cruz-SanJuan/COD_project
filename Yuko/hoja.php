<?php
$usuario = "root";
$contrasena = "utec";
$servidor = "localhost";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

$nombre = $_POST['Nombre'];
$apellidos = $_POST['Apellidos'];
$correo = $_POST['Correo'];
$password = $_POST['Password'];
$dia = $_POST['Dia'];
$mes = $_POST['Mes'];
$year = $_POST['Year'];

$consulta = "CALL IO_K_C('$nombre','$apellidos','$correo','$password');";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala");
echo $nombre;

mysqli_close( $conexion );
?>  