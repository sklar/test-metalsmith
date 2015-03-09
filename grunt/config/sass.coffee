##
# Compile Sass using node-sass.
# @see https://github.com/sindresorhus/grunt-sass
#

module.exports = (grunt) ->

    options:
        # includePaths: [
        #   '<%= path.vendor %>/compass/frameworks/compass/stylesheets'
        #   '<%= path.vendor %>/susy/sass'
        # ]
        precision: 5

    production:
        files: [
            expand: true
            cwd: '<%= path.source.asset %>/sass'
            src: ['*.scss']
            dest: '<%= path.build.asset %>/css'
            ext: '.css'
        ]
