// Step 1: Get user coordinates
function getCoordintes() {
    var options = {
        enableHighAccuracy: true,
        timeout: 500,
        maximumAge: 0,
    };

    function success(pos) {
        var crd = pos.coords;
        var lat = crd.latitude.toString();
        var lng = crd.longitude.toString();
        var coordinates = [lat, lng];
        console.log(`Latitude: ${lat}, Longitude: ${lng}`);
        getCity(coordinates);
        return;
    }

    function error(err) {
        console.warn(`ERROR(${err.code}): ${err.message}`);
    }

    navigator.geolocation.getCurrentPosition(success, error, options);
}

// Step 2: Get city name
function getCity(coordinates) {
    var xhr = new XMLHttpRequest();
    var lat = coordinates[0];
    var lng = coordinates[1];

    // Paste your LocationIQ token below.
    xhr.open(
        "GET",
        "https://us1.locationiq.com/v1/reverse.php?key=pk.273a0413bf061fe7b78301f70ccaee46&lat=" +
        lat +
        "&lon=" +
        lng +
        "&format=json",
        true
    );
    xhr.send();
    xhr.onreadystatechange = processRequest;
    xhr.addEventListener("readystatechange", processRequest, false);

    function processRequest(e) {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            var area = response.address.suburb;
            var location = response.address.quarter;
            var road = response.address.road;
            var city = response.address.city;
            var country = response.address.country;
            console.log(city);

            document.getElementById("location_field").value =
                area + ", " + location + ", " + city + ", " + country;
            return;
        }
    }
}
