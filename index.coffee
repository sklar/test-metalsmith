##
# Build.
# @author John Doe <john.doe@fbi.gov>
#

'use strict'

# Register CoffeeScript
require 'coffee-script/register'

# =================================
# Require packages/libs

path = require 'path'

Metalsmith  = require 'metalsmith'
collections = require 'metalsmith-collections'
layouts     = require 'metalsmith-layouts'
markdown    = require 'metalsmith-markdown'
navigation  = require 'metalsmith-navigation'
serve       = require 'metalsmith-serve'
templates   = require 'metalsmith-in-place'
watch       = require 'metalsmith-watch'
swig        = require 'swig'
swigdash    = require 'swig-lodash'


# =================================
# Add custom template filters

swigdash.useFilter swig, [
    'find'
    'isArray'
]

# swig.setFilter 'isArray', (input) ->
#     input instanceof Array



# =================================
# Run

metalsmith = Metalsmith __dirname
    .source 'src/documents'
    .use markdown()
    .use(
        (files, metalsmith, done) ->
            setImmediate(done)

            Object.keys(files).forEach((key) ->
                if typeof files[key].url == 'undefined'
                    # files[key].url = path.normalize('/' + key.replace('index.html', '/'))
                    files[key].url = key
                return
            )
            return
    )
    .use collections(
        articles:
            pattern: 'blog/**/!(index.*)'
            refer: false
    )
    .use navigation(
        {
            primary:
                filterProperty: 'navGroups'
                breadcrumbProperty: 'breadcrumbs'
                childrenProperty: 'children'
                pathProperty: 'path'
                sortBy: 'navOrder'
                includeDirs: true
        }
        {
            navListProperty: 'navigation'
        }
    )
    .use(
        (files, metalsmith, done) ->
            setImmediate(done)

            Object.keys(files).forEach((key) ->
                console.log '------'
                console.log key
                # console.log files[key]

                return
            )
            return
    )
    .use templates(
        engine: 'swig'
    )
    .use layouts(
        default: 'default.swg'
        directory: 'src/layouts'
        engine: 'swig'
    )
    .use serve(
        port: 5000
        verbose: true
    )
    .use watch (
        livereload: true
    )
    .clean false
    .build (err) ->
        throw err if err

