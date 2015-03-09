##
# Minify Stylesheets.
# @see https://www.npmjs.org/package/grunt-contrib-cssmin
#

module.exports = (grunt) ->

    options:
        banner: '<%= banner %>'
        keepSpecialComments: 0
        report: false

    development:
        options:
            report: 'gzip'
        files: [
            expand: true
            cwd: '<%= path.build.asset %>/css'
            src: ['*.css', '!*.min.css']
            dest: '<%= path.build.asset %>/css'
            ext: '.min.css'
        ]

    production:
        files: [
            expand: true
            cwd: '<%= path.build.asset %>/css'
            src: ['*.css', '!*.min.css']
            dest: '<%= path.build.asset %>/css'
            ext: '.min.css'
        ]
