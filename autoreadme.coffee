###
AutoReadme v0.0.1
http://jsliang.github.com/AutoReadme

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
###

# Reference jQuery
$ = jQuery

$(document).ready () ->
    converter = new Showdown.converter()

    env = new nunjucks.Environment()
    tmpl = new nunjucks.Template('<p>DEFAULT!</p> {{ contents }}')

    # fetch README.md file and turn the markdown to HTML
    $.getGithubFileByFilePath("jsliang", "sublime-pelican", "README.md", (contents) ->
        # $("body").html(converter.makeHtml(contents));
        templ_variables = {
            contents: converter.makeHtml(contents)
        }
        $("body").html( tmpl.render(templ_variables) )
        $(document).attr('title', $("h1:first").text())
    )