##
# @author David Sklar
#

'use strict'

# Register CoffeeScript
require 'coffee-script/register'

# =================================
# Require packages/libs

Metalsmith  = require 'metalsmith'
layouts     = require 'metalsmith-layouts'
markdown    = require 'metalsmith-markdown'
navigation  = require 'metalsmith-navigation'
serve       = require 'metalsmith-serve'
watch       = require 'metalsmith-watch'


# =================================
# Run

# nav = navigation(navConfig, navSettings);

navConfigs = {
    primary:{
        sortBy: 'nav_sort'
        filterProperty: 'nav_groups'
    }
    footer: {
        sortBy: 'nav_sort',
        filterProperty: 'nav_groups'
    }
}

navSettings = {
    navListProperty: 'navs'
}

navTask = navigation(navConfigs, navSettings)

Metalsmith __dirname
    .source('src/documents')
    .use markdown()
    .use layouts(
        default: 'default.html'
        directory: 'src/layouts'
        engine: 'eco'
    )
    .use navTask
    .use serve(
        port: 5000
        verbose: true
    )
    .use watch (
        livereload: true
    )
    .build (err) ->
        if (err)
            throw err






