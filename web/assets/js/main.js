document.addEventListener("DOMContentLoaded", function () {
    const filterButtons = document.querySelectorAll(".filters-button-group [data-filter]");
    const wrappers = document.querySelectorAll(".grids-wrapper .grid-wrapper");

    wrappers.forEach((wrapper) => {
        const originalWidth = wrapper.offsetWidth;
        wrapper.dataset.originalWidth = originalWidth;
        wrapper.style.width = originalWidth + "px";
        wrapper.style.transition = "width 0.5s ease, opacity 0.5s ease";
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
                    wrapper.style.display = "block";
                    requestAnimationFrame(() => {
                        wrapper.style.width = wrapper.dataset.originalWidth + "px";
                        wrapper.style.opacity = "1";
                    });
                } else {
                    wrapper.style.width = "0px";
                    wrapper.style.opacity = "0";

                    setTimeout(() => {
                        wrapper.style.display = "none";
                    }, 500); // gelijk aan transition-duration
                }
            });

            filterButtons.forEach((btn) => btn.classList.remove("is-checked"));
            this.classList.add("is-checked");
        });
    });
});
