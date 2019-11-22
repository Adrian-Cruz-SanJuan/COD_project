<?php
$usuario = "root";
$contrasena = "utec";
$servidor = "localhost:3306";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

$nombre = $_POST['Nombre'];
$apellidos = $_POST['Apellidos'];
$correo = $_POST['Correo'];
$password = $_POST['Password'];
$fecha = $_POST['Fecha'];


$consulta = "CALL Creacion_id_usuario('$nombre','$apellidos','$correo',MD5('$password'),'$fecha');";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala2");


header("Location:address_register.html");

mysqli_close( $conexion );
?>  

