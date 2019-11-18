<html>
    <head>

    </head>
    <body onload="findMe()">
    <div id='map'></div>

    <script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyCOgwVmk8f2Vj2yhWfZRANOE95HvgD4Xs4'></script>
    <script>
        function findMe(){
            var output = document.getElementById('map');

            //Verificar si soporta geolocalización
            if(navigator.geolocation){
                output.innerHTML = '<p>Tu navegador soporta Geolocalización</p>';
            }else{
                output.innerHTML = '<p>Tu navegador no soporta Geolocalización</p>';
            }

            //Obtenemos latitud y longitud
            function localizacion(posicion){
                var latitude = posicion.coords.latitude;
                var longitude = posicion.coords.longitude;
                var coordenadas = latitude.toString()+longitude.toString();
                output.innerHTML ="<p>Latitud: "+latitude+"<br>Longitud: "+longitude+"</p>";
                document.getElementById("lol").value=coordenadas;
            }

            function error(){
                output.innerHTML = '<p>No se pudo obtener tu localizacion</p>';
            }

            navigator.geolocation.getCurrentPosition(localizacion,error);

        }
    </script>
    <form action="ubicacion.php" method="POST">    
        <input type='text' id='lol' name='lol'>
        <button type="submit">Presione para continuar</button>
    </form>
    </body>
</html>