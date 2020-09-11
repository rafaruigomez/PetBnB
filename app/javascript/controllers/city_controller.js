import { Controller } from "stimulus";
import places from "places.js";

export default class extends Controller {
  connect() {
    this.initAutocomplete();
  }

  initAutocomplete = () => {
    const addressInput = document.getElementById("location");
    if (addressInput) {
      places({
        container: addressInput,
        templates: {
          value: function (suggestion) {
            return suggestion.name;
          }
        }
      }).configure({
        type: 'city',
        aroundLatLngViaIP: false
      });;
    }
  };
}
