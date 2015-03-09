##
# Copy files and folders.
# @see https://www.npmjs.org/package/grunt-contrib-copy
#

module.exports = (grunt) ->

    fonts:
        expand: true
        flatten: true
        cwd: '<%= path.source.asset %>/font'
        src: ['**/*.{eot,svg,ttf,woff}']
        dest: '<%= path.build.asset %>/font'

    icons:
        files: [
            {
                expand: true
                cwd: '<%= path.global.source %>'
                src: [
                    'browserconfig.xml'
                    'manifest.json'
                ]
                dest: '<%= path.global.build %>'
            }
            {
                expand: true
                cwd: '<%= path.source.asset %>'
                src: ['favicon.ico']
                dest: '<%= path.global.build %>'
            }
        ]
