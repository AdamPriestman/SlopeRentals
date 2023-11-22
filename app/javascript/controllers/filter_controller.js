import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["button", "filters"]

  connect() {
  }

  expandFilters() {
    this.buttonTarget.classList.add("d-none");
    this.filtersTarget.classList.remove("d-none");
  }

  closeFilters() {
    this.buttonTarget.classList.remove("d-none");
    this.filtersTarget.classList.add("d-none");
  }
}
