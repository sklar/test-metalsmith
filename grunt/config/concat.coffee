##
# Concatenate files.
# @see https://www.npmjs.org/package/grunt-contrib-concat
#

module.exports = (grunt) ->

    options:
        banner: '<%= banner %>'
        separator: '\n\n\n'

    production:
        files: [
            src: [
                '<%= path.vendor %>/normalize.css/normalize.css'
                '<%= path.build.asset %>/css/main.css'
            ]
            dest: '<%= path.build.asset %>/css/main.css'
            nonull: true
        ]
