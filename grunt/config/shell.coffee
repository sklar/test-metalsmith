##
# Run shell commands.
# @see https://www.npmjs.com/package/grunt-shell
#

module.exports = (grunt) ->

    options:
        failOnError: true
        stderr: true
        stdout: true

    bower:
        command: 'bower install --allow-root'

    build:
        command: 'node_modules/.bin/coffee index.coffee'

    npm:
        command: 'npm install'

    start:
        command: 'npm start'
