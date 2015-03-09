##
# Gruntfile.
# @author John Doe <john.doe@fbi.gov>
#

module.exports = (grunt) ->

    path = require 'path'


    # =================================
    # Options

    options =
        # Load package data.
        pkg: grunt.file.readJSON './package.json'

        # Set banner.
        banner: [
            '/**'
            ' * <%= pkg.title %> v<%= pkg.version %>'
            ' * Copyright (c) <%= grunt.template.today("yyyy") %>, <%= pkg.company.name %> <<%= pkg.company.url %>>'
            ' */'
            ''
        ].join('\n')

        # Set paths.
        path:
            global:
                build:      'build'
                source:     'src'
            build:
                asset:      '<%= path.global.build %>/assets'
            source:
                asset:      '<%= path.global.source %>/assets'


    # =================================
    # Plugins configuration
    # @see ./grunt/config/*.coffee



    # =================================
    # Custom tasks
    # @see ./grunt/config/aliases.coffee



    # =================================

    # Log execution time.
    # @see https://npmjs.org/package/time-grunt
    require('time-grunt') grunt

    # Load plugins.
    # @see https://npmjs.org/package/jit-grunt
    require('jit-grunt') grunt,
        replace: 'grunt-text-replace'

    # Load plugins configuration.
    # @see https://www.npmjs.org/package/load-grunt-config
    require('load-grunt-config') grunt,
        configPath: path.join process.cwd(), 'grunt/config'
        data: options
        loadGruntTasks: false



    # Prevent Coffeescript return.
    return
