import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="results-filter"
export default class extends Controller {
  static targets = ["checkboxItem", "result"];

  connect() {
    console.log("connected")
  }

  filterIndex() {
    console.log("-----Applied filters-----")

    const selectedFilters = this.getSelectedFilters();

    if (selectedFilters.length > 0) {
      this.fetchResults(selectedFilters);
    } else {
      this.fetchResults();
    }

  }

  fetchResults(filters = []) {
    fetch("listings/filter", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
      body: JSON.stringify({ filters }),
    })
      .then((response) => response.json())
      .then((data) => {
        this.renderResults(data);
      })
  }

  renderResults(data) {
    console.log(data)
    this.resultTargets.forEach((result) => {
      const shouldShow = data.includes(parseInt(result.dataset.id, 10))
      result.style.display = shouldShow ? "block" : "none";
    });
  }

  getSelectedFilters() {
    let selectedFilters =[]
    this.checkboxItemTargets.forEach((checkbox)=>{
      if (checkbox.checked) {
        selectedFilters.push(checkbox.value)
      }
    })
    return selectedFilters
  }
}
