##
# Start a connect web server.
# @see https://www.npmjs.com/package/grunt-contrib-connect
#

module.exports = (grunt) ->

    options:
        port: 5000
        hostname: 'localhost'
        keepalive: true
        livereload: true

    development:
            options:
                base: '<%= path.global.build %>'
                open:
                    target: [
                        'http://<%= connect.options.hostname %>'
                        ':<%= connect.options.port %>/'
                    ].join('')
