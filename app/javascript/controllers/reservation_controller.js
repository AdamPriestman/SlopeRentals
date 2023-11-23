import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation"
export default class extends Controller {
  static targets = ["reservations"]

  connect() {
  }

  displayReservations(event) {
    this.reservationsTarget.classList.toggle("d-none");
    if (event.target.innerText === "Reservations") {
      event.target.innerText = "Close";
    } else {
      event.target.innerText = "Reservations"
    }
  }
}
