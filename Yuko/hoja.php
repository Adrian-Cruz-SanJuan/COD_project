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

if($mes == 'Enero'){
    $g = '01';
}elseif ($mes == 'Febrero'){
    $g = '02';
}elseif ($mes == 'Marzo'){
    $g = '03';
}elseif ($mes == 'Abril'){
    $g = '04';
}elseif ($mes == 'Mayo'){
    $g = '05';
}elseif ($mes == 'Junio'){
    $g = '06';
}elseif ($mes == 'Julio'){
    $g = '07';
}elseif ($mes == 'Agosto'){
    $g = '08';
}elseif ($mes == 'Septiembre'){
    $g = '09';
}elseif ($mes == 'Octubre'){
    $g = '10';
}elseif ($mes == 'Noviembre'){
    $g = '11';
}elseif ($mes == 'Diciembre'){
    $g = '12';
}

$fecha = $year.'-'.$g.'-'.$dia;


$consulta = "CALL IO_K_C('$nombre','$apellidos','$correo','$password','$fecha');";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala");
echo $nombre;

mysqli_close( $conexion );
?>  