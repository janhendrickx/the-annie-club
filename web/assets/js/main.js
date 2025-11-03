document.addEventListener('DOMContentLoaded', function() {
    var elem = document.querySelector('.packery-grid');
    
    // De pure itemhoogte
    var itemHeight = 95; 

    var pckry = new Packery( elem, {
      itemSelector: '.packery-item',
      isHorizontal: true, 
      // Stel rowHeight in op de itemhoogte.
      rowHeight: itemHeight, 
      // Gutter van 10px
      gutter: 10 
    });

    imagesLoaded( elem ).on( 'always', function() {
        pckry.layout();

    var filterGroup = document.querySelector('.category-nav'); // Selecteer de navigatiecontainer
        
        filterGroup.addEventListener( 'click', function( event ) {
            
            // 1. Controleer of er op een 'a' tag met de class 'nav-link' is geklikt
            if ( !event.target.matches('.nav-link') ) {
                return;
            }
            
            // 2. VOORKOM dat de pagina naar de top springt
            event.preventDefault(); 
            
            var filterValue = event.target.getAttribute('data-filter');
            
            // 3. Pas het filter toe op het Packery/Isotope object
            pckry.filter( filterValue );
            
            // 4. Stijl de actieve link (is-checked class)
            var links = filterGroup.querySelectorAll('.nav-link');
            for ( var i=0; i < links.length; i++ ) {
                links[i].classList.remove('is-checked');
            }
            event.target.classList.add('is-checked');
        });

    });
});
