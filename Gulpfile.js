var gulp = require('gulp');

var connect = require('gulp-connect');

var bower = require('gulp-bower');

var coffee = require('gulp-coffee');

//var changed = require('gulp-changed');

var options = {
    // HTML
    HTML_SOURCE     : "views/**/*.tpl",

    // SASS / CSS
    SASS_SOURCE     : "sass/**/*.scss",
    SASS_DEST       : "../assets/css/",

    // JavaScript
    COFFEE_SOURCE   : "coffee/**/*.coffee",
    COFFEE_DEST     : "../assets/js/",

    // Images
    IMAGE_SOURCE    : "images/**/*",
    IMAGE_DEST      : "../assets/images",

    // Icons
    ICONS_SOURCE    : "src/sass/app/components/icons/svg/*.svg",
    ICONS_DEST      : "build/css/fonts/",

    // Live reload
    LIVE_RELOAD_PORT: 35729
};

// Compile Our Coffee
/*
gulp.task('coffee', function () {
    gulp.src( options.COFFEE_SOURCE )
        .pipe(changed ( options.COFFEE_SOURCE ))

        .pipe(gulp.dest( options.COFFEE_DEST ));
        //.pipe(livereload(server));
});*/

gulp.task('coffee', function() {
    gulp.src('./app/*.coffee')
        .pipe(coffee({bare: true}))
        .pipe(gulp.dest('./app/scripts/'));
});

gulp.task('connect', function () {
    connect.server({
        root: 'app/',
        port: 8889
    });
});

gulp.task('bower', function () {
    return bower('./app/bower_components');
});

