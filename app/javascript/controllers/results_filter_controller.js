import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="results-filter"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    console.log("connected")
  }

  filterIndex() {
    this.checkboxTargets.forEach((checkbox) =>{
      console.log(`${checkbox.value} => ${checkbox.checked}`)
    })
  }
}
