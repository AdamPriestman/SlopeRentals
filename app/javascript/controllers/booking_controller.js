import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {
  static targets = ["bookings", "listings", "bookingButton", "listingButton"]

  connect() {
  }

  displayBookings() {
    this.listingsTarget.classList.add("d-none");
    this.bookingsTarget.classList.remove("d-none");
    this.bookingButtonTarget.classList.add("active");
    this.listingButtonTarget.classList.remove("active");
  }

  displayListings() {
    this.listingsTarget.classList.remove("d-none");
    this.bookingsTarget.classList.add("d-none");
    this.bookingButtonTarget.classList.remove("active");
    this.listingButtonTarget.classList.add("active");
  }
}
