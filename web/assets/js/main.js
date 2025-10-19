document.addEventListener("DOMContentLoaded", function () {
    const filterButtons = document.querySelectorAll(".filters-button-group [data-filter]");
    const wrappers = document.querySelectorAll(".grids-wrapper .grid-wrapper");
    const container = document.querySelector(".grids-wrapper");

    // Initieel: breedte opslaan
    wrappers.forEach((wrapper) => {
        const originalWidth = wrapper.offsetWidth;
        wrapper.dataset.originalWidth = originalWidth;
        wrapper.style.maxWidth = originalWidth + "px";
        wrapper.style.transition = "max-width 0.5s ease, opacity 0.5s ease";
        wrapper.style.overflow = "hidden";
        wrapper.style.opacity = "1";
        wrapper.style.display = "block";
    });

    filterButtons.forEach((button) => {
        button.addEventListener("click", function (event) {
            event.preventDefault();
            const filterValue = this.getAttribute("data-filter").replace(".", "");

            wrappers.forEach((wrapper) => {
                const category = wrapper.dataset.category;
                const matches = filterValue === "*" || category === filterValue;

                if (matches) {
                    wrapper.classList.remove("hidden");
                    wrapper.style.maxWidth = wrapper.dataset.originalWidth + "px";
                    wrapper.style.opacity = "1";
                    wrapper.classList.add("active");
                } else {
                    wrapper.classList.remove("active");
                    wrapper.style.maxWidth = "0px";
                    wrapper.style.opacity = "0";
                    wrapper.classList.add("hidden");
                }
            });

            // Scroll naar eerste zichtbare element
            setTimeout(() => {
                const firstVisible = Array.from(wrappers).find(
                    (wrapper) => !wrapper.classList.contains("hidden")
                );

                if (firstVisible) {
                    const offset = firstVisible.offsetLeft;
                    container.scrollTo({
                        left: offset,
                        behavior: "smooth"
                    });
                }
            }, 550);

            // Activeer knopstijl
            filterButtons.forEach((btn) => btn.classList.remove("is-checked"));
            this.classList.add("is-checked");
        });
    });
});
