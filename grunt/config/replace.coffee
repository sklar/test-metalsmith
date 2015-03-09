##
# Replace text in files.
# @see https://www.npmjs.org/package/grunt-text-replace
#

module.exports = (grunt) ->

    # 1. Fix Libsass compilation error caused by Compass `linear-gradient` function.
    #   @see https://github.com/sass/libsass/issues/78

    sheets:
        src: [
            '<%= path.build.asset %>/css/*.css'
        ]
        overwrite: true
        replacements: [{
            from: /\s{1}-linear-gradient\((.{10,})\.{3}\);/g    # 1
            to: ' linear-gradient($1);'
        }]
