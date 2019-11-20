<?php
$usuario=$_POST['correo'];
$contra=$_POST['contra'];

//conexion a la base de datos
$conexion=mysqli_connect('localhost', 'root', '', 'COSECHANDO');
$consulta="SELECT * FROM USUARIO WHERE CORREO_U='$usuario' AND PASSWORD_U='$contra'";
$resultado=mysqli_query($conexion, $consulta);

//validacion
$filas=mysqli_num_rows($resultado);
if ($filas > 0) {
    header('location:main_user.html');
}
else {
    echo 'Fallo en la autenticación';
}
mysqli_close($conexion);
