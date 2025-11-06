const { src, dest, watch, series, parallel } = require('gulp');
const sass = require('gulp-dart-sass');
const postcss = require('gulp-postcss');
const autoprefixer = require('autoprefixer');
const cleanCSS = require('gulp-clean-css');
const concat = require('gulp-concat');
const browserSync = require('browser-sync').create();
const path = require('path');

// --- FONT AWESOME CONFIGURATIE ---
const faPath = './node_modules/fontawesome-free/'; 
const publicAssets = 'web/assets/';
// Bestemming voor de SCSS bestanden
const faScssDest = publicAssets + 'sass/fontawesome/'; 
// ✅ Aangepaste bestemming voor de fonts
const faFontsDest = publicAssets + 'fonts/'; 

/**
 * 🎨 Kopieert alle Font Awesome fonts (Webfonts) naar de publieke 'fonts' map.
 */
function copyFaFonts() {
    // Kopieert van /webfonts/ naar /web/assets/fonts/
    return src(faPath + 'webfonts/*')
        .pipe(dest(faFontsDest)); 
}

/**
 * 📝 Kopieert de Font Awesome SCSS-bestanden naar je lokale Sass map.
 */
function copyFaScss() {
    // Kopieert de hele 'scss' map naar web/assets/sass/fontawesome/
    return src(faPath + 'scss/**/*.scss')
        .pipe(dest(faScssDest));
}

// Exporteer de FA-taken
exports['fa:fonts'] = copyFaFonts;
exports['fa:scss'] = copyFaScss;
// De gecombineerde taak voor de benodigde Font Awesome bestanden
exports['fa:copy'] = series(copyFaFonts, copyFaScss); 
// --- EINDE FONT AWESOME CONFIGURATIE ---


// // Pad naar je SSL-certificaat en sleutel (pas deze paden aan naar je eigen certificaten)
// const certPath = path.join('/Applications/ServBay/ssl/private/tls-certs/eskobar.local', 'eskobar.local.crt');
// const keyPath = path.join('/Applications/ServBay/ssl/private/tls-certs/eskobar.local', 'eskobar.local.key');

// Compile Sass naar CSS
function compileSass() {
    const sass = require('gulp-dart-sass');
    console.log('Loaded gulp-dart-sass version:', sass.compiler.info);
    

    return src('web/assets/sass/theme.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(postcss([autoprefixer()]))
        .pipe(concat('style.css'))
        .pipe(dest('web/assets/css'))
        .pipe(browserSync.stream());
}

// Minify CSS
function minifyCSS() {
    return src('web/assets/css/style.css', { allowEmpty: true })
        .pipe(cleanCSS({ compatibility: 'ie8' }).on('error', (err) => {
            console.error('Error in clean-css:', err.message);
        }))
        .pipe(concat('style.min.css'))
        .pipe(dest('web/assets/css'));
}

// Watch voor wijzigingen
function watchFiles() {
    // Watch zowel je eigen SCSS als de gekopieerde Font Awesome SCSS
    watch('web/assets/sass/**/*.scss', series(compileSass, minifyCSS)); 
    watch('web/assets/css/style.min.css').on('change', browserSync.reload); 
}

// Default task: Eerst alles kopiëren/compileren, daarna de watches starten
exports.default = series(
    // Kopieer de fonts en de SCSS bestanden
    exports['fa:copy'], 
    // Bestaande CSS-taken
    parallel(compileSass, minifyCSS),
    watchFiles
);