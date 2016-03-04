var gulp = require('gulp');

var connect = require('gulp-connect');

var bower = require('gulp-bower');

var coffee = require('gulp-coffee');

//var changed = require('gulp-changed');

gulp.task('coffee', function() {
    gulp.src('./**/*.coffee')
        .pipe(coffee({bare: true}))
        .pipe(gulp.dest('./public/'));

    gulp.src(['./**/*.html', './**/*.css', './**/includes.js'])
        .pipe(gulp.dest('./public/'));
});

gulp.task('connect', function () {
    connect.server({
        root: 'public/app',
        port: 8889
    });
});

gulp.task('bower', function () {
    return bower('./public/app/bower_components');
});

