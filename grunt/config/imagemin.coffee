##
# Minify images.
# @see https://www.npmjs.org/package/grunt-contrib-imagemin
#

module.exports = (grunt) ->

    options:
        svgoPlugins: [
            cleanupEnableBackground: false
            removeViewBox: false
        ]

    production:
        files: [
            {
                expand: true
                cwd: '<%= path.source.asset %>/gfx'
                src: ['*.{gif,jpg,png,svg}']
                dest: '<%= path.build.asset %>/gfx'
            }
            {
                expand: true
                flatten: true
                cwd: '<%= path.source.asset %>'
                src: ['apple*.png']
                dest: '<%= path.global.build %>'
            }
            {
                expand: true
                flatten: true
                cwd: '<%= path.source.asset %>'
                src: [
                    'metro*.png'
                    'launcher-icon@*.png'
                ]
                dest: '<%= path.build.asset %>'
            }
        ]
