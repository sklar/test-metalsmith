##
# Add vendor prefixes to CSS files.
# @see https://www.npmjs.org/package/grunt-autoprefixer
#

module.exports = (grunt) ->

    options:
        # @see https://github.com/ai/autoprefixer
        browsers: [
            'last 2 versions'
        ]

    production:
        expand: true
        cwd: '<%= path.build.asset %>/css'
        src: [
            '*.css'
            '!*.min.css'
        ]
        dest: '<%= path.build.asset %>/css'
