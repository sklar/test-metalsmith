##
# Minify HTML using minimize.
# @see https://www.npmjs.com/package/grunt-minify-html
#

module.exports = (grunt) ->

    production:
        files: [
            {
                expand: true
                cwd: '<%= path.test.template %>'
                src: ['mail_*.html']
                dest: '<%= path.test.template %>'
            }
        ]
