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
}else{
    echo '<script type="text/javascript">
    alert("Todos los campos deben estar llenos");
    window.location.href="sing_in.html";
    </script>';
}

$fecha = $year.'-'.$g.'-'.$dia;


$consulta = "CALL Creacion_id_usuario('$nombre','$apellidos','$correo',AES_ENCRYPT('$password','gato'),'$fecha');";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala2");

/*$consulta_id = "SELECT USUARIO_ID FROM USUARIO WHERE CORREO_U = '$correo' AND PASSWORD_U = '$password';";
$resultadoid = mysqli_query( $conexion, $consulta_id ) or die ( "Algo ha ido mal en la consulta verificala1");*/

//echo $resultadoid;
header("Location:address_register.html");

mysqli_close( $conexion );
?>  