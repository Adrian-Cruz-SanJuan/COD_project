<?php

//Conexion a la base de datos
$usuario = "root";
$contrasena = "";
$servidor = "localhost:3306";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

// Obtención de datos
$Nombre = $_POST["Nombre"];
$Tamaño = $_POST["Tamaño"];
$Tipo = $_POST["Tipo"];
$Descripcion = $_POST["Descripcion"];

// INSERT a la BDD
$insertar = "INSERT INTO PLANTA (NOMBRE_P, TAMANO_P,TIPO, DESCRIPCION_P) VALUES ('$Nombre', '$Tamaño', '$Tipo', '$Descripcion');";

// Ejecución del INSERT
$Resultado = mysqli_query($conexion, $insertar);
if(!$Resultado){
    echo "Error en el registro    ";
    printf($conexion->error);
} else {
    echo '<script language="javascript">alert("Registro realizado de forma exitosa");
    window.location.href="../panel-control.html"</script>';
}
// Matar conexión
mysqli_close($conexion);
?>