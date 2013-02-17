###
AutoReadme v0.0.1
http://jsliang.github.com/AutoReadme

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
###

# Reference jQuery
$ = jQuery

$.fn.extend
  autoReadme: ( options ) ->

    if options? and options.template?
      template = options.template
    else
      template = "default"

    template_str = $("#template ##{template}").html()
    $("#template").hide()

    this.each ()->
      container = $(this)

      convert_markdown_to_html = () ->
        converter = new Showdown.converter()
        contents = container.html()
        container.html( converter.makeHtml(contents) )

      apply_template = () ->
        env = new nunjucks.Environment()
        tmpl = new nunjucks.Template( template_str )

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
          headings: h2_headings,
          contents: container.html()
        }

        if options? and not options.name? and options.repository?
          templ_variables.name = options.repository
        else
          templ_variables.name = ''

        templ_variables = $.extend(templ_variables, options)
        container.html( tmpl.render(templ_variables) )

      makedoc = () ->
        convert_markdown_to_html()
        $(document).attr('title', container.find("h1:first").text())
        apply_template()

      # fetch README.md file
      if options? and options.username? and options.repository? and options.filename?
        username = options.username
        repository = options.repository
        filename = options.filename
        $.ajax
          type: "GET"
          url: "https://api.github.com/repos/#{username}/#{repository}/contents/#{filename}"
          dataType: "jsonp"
          success: (data) ->
            decoded_content = window.atob(data.data.content.replace(/\n/g, "").replace(/\r/g, ""))
            decoded_content = decoded_content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&")
            container.text(decoded_content)
        .done (makedoc)
      else
        makedoc()

