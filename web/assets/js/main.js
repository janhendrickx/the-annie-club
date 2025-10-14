// Zorg dat de DOM geladen is
document.addEventListener("DOMContentLoaded", function () {
  // Initieer Isotope
  var iso = new Isotope(".grids-wrapper", {
    itemSelector: ".grid-item",
  });

  // Filterknoppen
  var filtersElem = document.querySelector(".filters-button-group");

  filtersElem.addEventListener("click", function (event) {
    event.preventDefault(); // voorkom springen bij <a href="#">
    var target = event.target;
    if (!target.matches("a, button")) return;

    var filterValue = target.getAttribute("data-filter");
    iso.arrange({ filter: filterValue });

    // Optioneel: visuele feedback
    filtersElem.querySelectorAll(".is-checked").forEach(function (el) {
      el.classList.remove("is-checked");
    });
    target.classList.add("is-checked");
  });
});
