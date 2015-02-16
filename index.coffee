##
# @author David Sklar
#

'use strict'

# Register CoffeeScript
require 'coffee-script/register'

# =================================
# Require packages/libs

path = require 'path'

Metalsmith  = require 'metalsmith'
collections = require 'metalsmith-collections'
templates   = require 'metalsmith-in-place'
layouts     = require 'metalsmith-layouts'
markdown    = require 'metalsmith-markdown'
navigation  = require 'metalsmith-navigation'
# path        = require 'metalsmith-path'
serve       = require 'metalsmith-serve'
watch       = require 'metalsmith-watch'



# =================================
# Run

Metalsmith __dirname
    .source('src/documents')
    # .use path()
    .use collections(
        articles: {
            pattern: 'blog/**/!(index.*)'
            refer: false
        }
    )
    .use markdown()
    .use(
        (files, metalsmith, done) ->
            setImmediate(done)
            # console.log files
            Object
                .keys(files)
                .forEach((file) ->
                    # if (!/\.html/.test(path.extname(file))) {
                    #     return
                    # }

                    data = files[file]
                    # data.path = path.join(path.dirname(file), path.basename(file, path.extname(file)))
                    data.path = path.join(path.dirname(file), path.basename(file))
                    return
                )
            # done()
            return
    )

    .use templates(
        engine: 'eco'
    )
    .use layouts(
        default: 'default.eco'
        directory: 'src/layouts'
        engine: 'eco'
    )
    .use navigation(
        primary: {
            filterProperty: 'navGroups'
        }
    )
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








