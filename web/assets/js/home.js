document.addEventListener('DOMContentLoaded', function() {
    var elem = document.querySelector('.packery-grid');
    var itemHeight = 145;

    var pckry = new Packery(elem, {
        itemSelector: '.packery-item',
        isHorizontal: true,
        rowHeight: itemHeight,
        gutter: 10
    });

    imagesLoaded(elem).on('always', function() {
        pckry.layout();
    });

    // 🔍 Filtering
    var filterLinks = document.querySelectorAll('.filters-button-group .nav-link');

    filterLinks.forEach(function(link) {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            var filterValue = this.getAttribute('data-filter');
            var items = document.querySelectorAll('.packery-item');

            items.forEach(function(item) {
                if (filterValue === '*' || item.classList.contains(filterValue.slice(1))) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });

            // 🔄 Herlayout Packery
            pckry.layout();

            // ✅ Lightbox fix: enkel zichtbare links
            document.querySelectorAll('.packery-item a[data-lightbox]').forEach(function(link) {
                link.removeAttribute('data-lightbox');
            });

            document.querySelectorAll('.packery-item').forEach(function(item) {
                if (item.style.display !== 'none') {
                    var link = item.querySelector('a');
                    if (link) {
                        link.setAttribute('data-lightbox', 'packery-gallery');
                    }
                }
            });

            // 🎯 Active class wisselen
            filterLinks.forEach(l => l.classList.remove('is-checked'));
            this.classList.add('is-checked');
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const swiper = new Swiper('.category-swiper-container', {
        direction: 'horizontal',
        slidesPerView: 'auto', 
        spaceBetween: 0, 
        loop: true, 
        grabCursor: true, 
        
        // ⭐ Laat de beweging vrij (belangrijk voor native scroll)
        freeMode: true,
        
        // ⭐ Schakelt muiswiel-ondersteuning in
        mousewheel: {
            // Laat scroll-events door de Swiper gaan wanneer de rand bereikt is
            releaseOnEdges: true, 
        },
        
        scrollbar: {
            el: '.swiper-scrollbar',
            hide: true, 
        },
    });
});



document.addEventListener('DOMContentLoaded', function() {
    const swiper = new Swiper('.category-swiper-container', {
        // Vereist voor horizontale navigatie
        direction: 'horizontal',
        
        // Laat de slides hun eigen breedte bepalen
        slidesPerView: 'auto', 
        
        // Afstand tussen de slides
        spaceBetween: 10, 
        
        // Activeer de loop (Infinite Scroll)
        loop: true, 

        // ⭐ NIEUW: Activeer de "sleep" cursor en functionaliteit
        grabCursor: true, 

        // Zorgt ervoor dat de filters snel reageren
        freeMode: true,
        
        // Optioneel: Scrollbar toevoegen
        scrollbar: {
            el: '.swiper-scrollbar',
            hide: true, 
        },
    });
});