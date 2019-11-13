<?php
$usuario = "root";
$contrasena = "utec";
$servidor = "localhost";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );


echo '<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v3"></script>
<div id="map"></div>
<script>
    function findMe(){
        var output = document.getElementById('map');
        function localizacion(posicion){
            var latitude = posicion.coords.latitude;
            var longitude = posicion.coords.longitude;
            output.innerHTML = latitude;
            output.innerHTML = longitude;    
        }
        function error(){
            output.innerHTML = "<p>No se pudo obtener tu ubicación</p>";
        }
        navigator.geolocation.getCurrentPosition(localizacion,error);
    }
</script>'

$consulta = "INSERT INTO TERRENO";
$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta verificala");

header("Location:address_register.html");

mysqli_close( $conexion );
?>  