import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation"
export default class extends Controller {
  static targets = ["reservations"]

  connect() {
  }

  displayReservations() {
    this.reservationsTarget.classList.remove("d-none");
  }
}
