// Generated by CoffeeScript 1.4.0

/*
AutoReadme v0.0.1
http://jsliang.com/AutoReadme

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
*/


(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    autoReadme: function(options) {
      var template, template_DOM, template_DOM_content_non_empty, template_DOM_exists_in_page, template_str;
      if ((options != null) && (options.template != null)) {
        template = options.template;
      } else {
        template = "default";
      }
      template_DOM = $("#template #" + template);
      template_DOM_exists_in_page = template_DOM.length > 0;
      template_DOM_content_non_empty = $.trim(template_DOM.html()).length > 0;
      if (template_DOM_exists_in_page && template_DOM_content_non_empty) {
        template_str = $("#template #" + template).html();
      } else {
        template_str = '\
        <a href="http://github.com/{{ username }}/{{ repository }}">\
          <img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub">\
        </a>\
        <div id="TOC">\
          <h1>{{ name }}</h1>\
          <ul>\
            {% for heading in headings %}\
            <li>\
              <a href="#{{ heading.id }}">{{ heading.text }}</a>\
              <ul>\
                {% for subheading in heading.subheadings %}\
                <li><a href="#{{ subheading.id }}">{{ subheading.text }}</a></li>\
                {% endfor %}\
              </ul>\
            </li>\
            {% endfor %}\
          </ul>\
        </div>\
        <div id="content">{{ contents }}</div>\
        ';
      }
      $("#template").hide();
      return this.each(function() {
        var apply_template, container, convert_markdown_to_html, filename, makedoc, repository, username;
        container = $(this);
        convert_markdown_to_html = function() {
          var contents, converter;
          converter = new Showdown.converter();
          contents = container.html();
          container.html(converter.makeHtml(contents));
          return container.find("code").each(function() {
            var code_str, new_code_str;
            code_str = $(this).text();
            new_code_str = code_str.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&");
            return $(this).text(new_code_str);
          });
        };
        apply_template = function() {
          var env, h2_headings, templ_variables, tmpl;
          env = new nunjucks.Environment();
          tmpl = new nunjucks.Template(template_str);
          h2_headings = [];
          $("h2").each(function() {
            var h3_headings, heading, subheading_elements;
            h3_headings = [];
            subheading_elements = $(this).nextUntil("h2", "h3");
            if (subheading_elements != null) {
              subheading_elements.each(function() {
                var subheading;
                subheading = {
                  id: $(this).attr('id'),
                  text: $(this).text()
                };
                return h3_headings.push(subheading);
              });
            }
            heading = {
              id: $(this).attr('id'),
              text: $(this).text(),
              subheadings: h3_headings
            };
            return h2_headings.push(heading);
          });
          templ_variables = {
            headings: h2_headings,
            contents: container.html()
          };
          if ((options != null) && !(options.name != null) && (options.repository != null)) {
            templ_variables.name = options.repository;
          } else {
            templ_variables.name = '';
          }
          templ_variables = $.extend(templ_variables, options);
          container.html(tmpl.render(templ_variables));
          return $('pre code').each(function(i, e) {
            return hljs.highlightBlock(e);
          });
        };
        makedoc = function() {
          convert_markdown_to_html();
          $(document).attr('title', container.find("h1:first").text());
          return apply_template();
        };
        if ((options != null) && (options.username != null) && (options.repository != null) && (options.filename != null)) {
          username = options.username;
          repository = options.repository;
          filename = options.filename;
          return $.ajax({
            type: "GET",
            url: "https://api.github.com/repos/" + username + "/" + repository + "/contents/" + filename,
            dataType: "jsonp",
            success: function(data) {
              var decoded_content;
              decoded_content = window.atob(data.data.content.replace(/\n/g, "").replace(/\r/g, ""));
              decoded_content = decoded_content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&");
              return container.text(decoded_content);
            }
          }).done(makedoc);
        } else {
          return makedoc();
        }
      });
    }
  });

}).call(this);
