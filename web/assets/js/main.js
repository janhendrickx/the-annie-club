// init Swiper:
// const swiper = new Swiper('.swiper', {
//     pagination: {
//         el: '.swiper-pagination',
//     },
// });

// vanilla JS
var grid = document.querySelector('.grid');
var iso = new Isotope( grid, {
  // options...
  itemSelector: '.grid-item',
  masonry: {
    columnWidth: 200
  }
});