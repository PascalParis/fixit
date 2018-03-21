// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var providerAddress = document.getElementById('provider_address');

    if (providerAddress) {
      var autocomplete = new google.maps.places.Autocomplete(providerAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(providerAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
