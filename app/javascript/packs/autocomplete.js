// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var my_address = document.getElementById('provider_address');
    var my_address2 = document.getElementById('address');

    if (my_address) {
      var autocomplete = new google.maps.places.Autocomplete(my_address, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(my_address, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
    if (my_address2) {
      var autocomplete = new google.maps.places.Autocomplete(my_address2, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(my_address2, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
