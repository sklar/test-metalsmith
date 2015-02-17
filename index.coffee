###*
 * @author David Sklar
###

'use strict'

# Register CoffeeScript
require 'coffee-script/register'

# =================================
# Require packages/libs

path = require 'path'

metalsmith  = require 'metalsmith'
collections = require 'metalsmith-collections'
layouts     = require 'metalsmith-layouts'
markdown    = require 'metalsmith-markdown'
navigation  = require 'metalsmith-navigation'
serve       = require 'metalsmith-serve'
templates   = require 'metalsmith-in-place'
watch       = require 'metalsmith-watch'



# =================================
# Run

### Inline comment A ###
`// Inline comment B`

metalsmith __dirname
    .source('src/documents')
    .use markdown()
    .use collections(
        all:
            pattern: '**/*'
            refer: false
        articles:
            pattern: 'blog/**/!(index.*)'
            refer: false
    )
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

                    metadata = files[file]
                    # metadata.path = path.join(path.dirname(file), path.basename(file, path.extname(file)))
                    metadata.basename = path.basename(file).replace('index.html', '')
                    metadata.url = path.join(path.dirname(file), path.basename(file))
                    metadata.url = metadata.url.replace('index.html', '')
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




