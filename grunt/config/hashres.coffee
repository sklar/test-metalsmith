##
# Hash assets and update its references.
# @see https://www.npmjs.com/package/grunt-hashres
#

module.exports = (grunt) ->

    options:
        fileNameFormat: '${name}.${ext}?v=${hash}'
        renameFiles: false

    assets:
        src: [
            '<%= path.build.asset %>/css/*.css'
        ]
        dest: [
            '<%= path.global.build %>/*.html'
        ]

    sheets:
        src: [
            '<%= path.build.asset %>/font/*.woff'
            '<%= path.build.asset %>/gfx/*.svg'
        ]
        dest: [
            '<%= path.build.asset %>/css/*.css'
        ]

