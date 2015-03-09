##
# Clean files and folders.
# @see https://www.npmjs.org/package/grunt-contrib-clean
#

module.exports = (grunt) ->

    options:
        force: true

    build:
        src: [
            '<%= path.global.build %>'
        ]
