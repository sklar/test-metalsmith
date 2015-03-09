##
# Run tasks whenever watched files are changed.
# @see https://npmjs.org/package/grunt-contrib-watch
#

module.exports = (grunt) ->

    options:
        livereload: true

    # sheets:
    #     files: [
    #         '<%= path.source.asset %>/sass/**/*.scss'
    #     ]
    #     tasks: [
    #         'sass:production'
    #         'replace:sheets'
    #         'newer:autoprefixer:production'
    #         'concat:production'
    #         'cssmin:development'
    #     ]

    # scripts:
    #     files: [
    #         '<%= path.global.source %>/**/*.js'
    #     ]
    #     tasks: [
    #         'shell:build'
    #     ]


    documents:
        files: [
            '<%= path.global.source %>/documents/**'
        ]
        tasks: [
            'shell:build'
        ]

    templates:
        files: [
            '<%= path.global.source %>/layouts/**'
            '<%= path.global.source %>/partials/**'
        ]
        tasks: [
            'shell:build'
        ]
