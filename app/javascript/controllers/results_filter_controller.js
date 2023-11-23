import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="results-filter"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    console.log("connected")
  }

  filterIndex() {
    console.log(this.checkboxTarget.checked)
  }
}
