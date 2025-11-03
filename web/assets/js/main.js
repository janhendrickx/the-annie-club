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
        
    });
});
