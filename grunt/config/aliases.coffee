module.exports = (grunt) ->

    build: [
        'clean'
        'shell:npm'
        'shell:bower'
        'shell:build'

        'copy'

        # 'images'
        # 'sass'
        # 'replace:sheets'
        # 'autoprefixer:production'
        # 'concat:production'
        # 'cssmin:production'

        # 'hashres:app'
        # 'hashres:sheets'
    ]

    default: [
        'watch'
    ]

    images: [
        'imagemin'
    ]

    # sheets: [
    #     'sass'
    #     'replace:sheets'
    #     'autoprefixer:production'
    #     'concat:production'
    #     'cssmin:development'
    #     'hashres:sheets'
    # ]

    # server: [
    #     'connect'
    #     'watch'
    # ]

    start: [
        'shell:npm'
        'shell:bower'
        'shell:build'
    ]
