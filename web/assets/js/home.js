document.addEventListener('DOMContentLoaded', function() {
    
    // --- Algemene Variabelen & Breakpoint ---
    const MOBILE_BREAKPOINT = 768; 
    const isMobile = window.innerWidth < MOBILE_BREAKPOINT;
    
    // --- Hulpfunctie: Filter toepassen ---
    function applyFilter(filterValue) {
        var items = document.querySelectorAll('.packery-item');

        // 🎯 Items tonen/verbergen
        items.forEach(function(item) {
            if (filterValue === '*' || item.classList.contains(filterValue.slice(1))) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
        
        // ✅ Lightbox fix: enkel zichtbare links
        document.querySelectorAll('.packery-item a').forEach(function(link) {
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
        
        // 🎯 Active class wisselen (moet de filterValue matchen met de data-filter)
        document.querySelectorAll('.filters-button-group .nav-link').forEach(l => {
            if (l.getAttribute('data-filter') === filterValue) {
                l.classList.add('is-checked');
            } else {
                l.classList.remove('is-checked');
            }
        });
    }

    // --- Packery Initialisatie & Herlayout (Desktop) ---
    var elem = document.querySelector('.packery-grid');
    var itemHeight = 150;
    let pckry; 
    
    if (!isMobile) {
        pckry = new Packery(elem, {
            itemSelector: '.packery-item',
            isHorizontal: true,
            rowHeight: itemHeight,
            gutter: 10
        });

        imagesLoaded(elem).on('always', function() {
            // 1. Controleer de URL hash bij het laden
            const initialFilter = window.location.hash.substring(1);
            if (initialFilter) {
                applyFilter(initialFilter);
                pckry.layout();
            } else {
                pckry.layout();
            }
        });
    } else {
        console.log("Mobiele weergave gedetecteerd. Packery initialisatie overgeslagen.");
        // 1. Mobiel: Controleer de URL hash bij het laden
        const initialFilter = window.location.hash.substring(1);
        if (initialFilter) {
            applyFilter(initialFilter);
        }
    }
    
    // --- 2. Filtering Event Listener ---
    document.querySelectorAll('.filters-button-group .nav-link').forEach(function(link) {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            var filterValue = this.getAttribute('data-filter');
            
            // 🛑 CRUCIAAL: Update de URL hash voordat je iets anders doet
            window.location.hash = filterValue; 

            // ----------------------------------------------------
            // 🚀 CONDITIEEL REFRESH/RELAYOUT
            // ----------------------------------------------------
            if (isMobile) {
                // Op mobiel: Reload de pagina, de hash wordt behouden
                window.location.reload(); 
            } else {
                // Op Desktop: Pas filter toe en herlayout
                applyFilter(filterValue);
                if (pckry) {
                    pckry.layout();
                }
            }
        });
    });

    // --- Debouncing voor Resizen (ALLEEN OP DESKTOP/TABLET) ---
    if (!isMobile) {
        let resizeTimer;
        window.addEventListener('resize', function() {
            clearTimeout(resizeTimer);
            
            resizeTimer = setTimeout(function() {
                if (window.innerWidth >= MOBILE_BREAKPOINT && pckry) {
                    pckry.layout(); 
                }
            }, 250);
        });
    }
});

// --- SWIPER / OFFCANVAS BLIJFT HIER ONVERANDERD ---

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
        slidesPerView: '8', 
        
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


document.addEventListener('DOMContentLoaded', function() {
    
    // Selecteer alle navigatielinks die de categorieën filteren
    const navLinks = document.querySelectorAll('.nav-cat-link');
    
    // De ID van je Offcanvas element
    const offcanvasId = 'offcanvasNav';
    const offcanvasElement = document.getElementById(offcanvasId);

    // Controleer of de Offcanvas bestaat op de pagina
    if (offcanvasElement) {
        
        // Zorg ervoor dat de Bootstrap Offcanvas instance beschikbaar is
        // We gebruiken hier getOrCreateInstance() om te garanderen dat we de Offcanvas API kunnen aanroepen.
        const offcanvasInstance = bootstrap.Offcanvas.getOrCreateInstance(offcanvasElement);

        navLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                
                // Optioneel: e.preventDefault() toevoegen als je filtering met JS doet,
                // om te voorkomen dat de browser naar '#' springt.
                // e.preventDefault(); 
                
                // 1. VOER HIER JE FILTER LOGICA UIT
                const filterValue = e.target.getAttribute('data-filter');
                console.log('Filter aangeklikt:', filterValue);
                // Bijv: myIsotopeInstance.arrange({ filter: filterValue });
                
                
                // 2. SLUIT DE OFF CANVAS
                // We checken de grootte van het scherm
                // Als het een desktop is (>= lg), moet de Offcanvas niet sluiten (want hij is inline)
                // Als het mobiel is, sluiten we hem. 
                // Bootstrap's responsive classes helpen ons hier:
                if (window.innerWidth < 768) { // 992px is het 'lg' breakpoint van Bootstrap
                    offcanvasInstance.hide();
                }
            });
        });
    }
});