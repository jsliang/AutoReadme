###
AutoReadme v0.0.1
http://jsliang.github.com/AutoReadme

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
###

# Reference jQuery
$ = jQuery

generate_template = () ->
    template_str = '
<div id="TOC">
    <h1>{{ name }}</h1>
    <ul>
    {% for heading in headings %}
    <li>
        <a href="#{{ heading.id }}">{{ heading.text }}</a>
        <ul>
        {% for subheading in heading.subheadings %}
        <li>
            <a href="#{{ subheading.id }}">{{ subheading.text }}</a>
        </li>
        {% endfor %}
        </ul>
    </li>
    {% endfor %}
    </ul>
</div>
<div id="content">{{ contents }}</div>
'
    return template_str

$.fn.extend
    autoReadme: () ->
        this.each ()->
            container = $(this)

            convert_markdown_to_html = () ->
                converter = new Showdown.converter()
                contents = container.html()
                container.html( converter.makeHtml(contents) )

            apply_template = () ->
                env = new nunjucks.Environment()
                tmpl = new nunjucks.Template( generate_template() )

                h2_headings = []
                $("h2").each () ->
                    h3_headings = []

                    subheading_elements = $(this).nextUntil("h2", "h3")
                    if subheading_elements?
                        subheading_elements.each () ->
                            subheading =
                                id: $(this).attr('id')
                                text: $(this).text()
                            h3_headings.push(subheading)

                    heading =
                        id: $(this).attr('id')
                        text: $(this).text()
                        subheadings: h3_headings

                    h2_headings.push(heading)

                templ_variables = {
                    name: "SublimePelican",
                    headings: h2_headings,
                    contents: container.html()
                }
                container.html( tmpl.render(templ_variables) )

            # fetch README.md file and turn the markdown to HTML
            ###
            $.getGithubFileByFilePath("jsliang", "sublime-pelican", "README.md", (contents) ->
                $(this).html(converter.makeHtml(contents))
                $(document).attr('title', $("h1:first").text())
            )
            ###
            convert_markdown_to_html()
            apply_template()
