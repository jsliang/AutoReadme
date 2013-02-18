AutoReadme
==========

## Usage

Using AutoReadme is quick and simple. Simply create an `index.html` and fill in its content like below:
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="http://yandex.st/highlightjs/7.3/styles/github.min.css">
    <link rel="stylesheet" href="default.css">
  </head>
  <body>
    <div id="container"></div>

    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="showdown/src/showdown.js"></script>
    <script src="nunjucks/browser/nunjucks-dev.js"></script>
    <script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
    <script src="autoreadme.js"></script>
    <script>
    $(document).ready(function() {
      $("#container").autoReadme( {
        username: "jsliang",      // GitHub username
        repository: "AutoReadme", // GitHub repository
        filename: "README.md",    // filename of your README
        name: "AutoReadme",       // repository name to show in the page title
        template: "default"       // pick a template :P
      } );
    });
    </script>
  </body>
</html>
```
With `$("#container").autoReadme(...)`, AutoReadme automatically fetches and parse the content of your `README.md` in default branch from GitHub via GitHub API, i.e. https://api.github.com/repos/jsliang/AutoReadme/contents/README.md in the above sample.
AutoReadme then replace the content of the `$("#container")` element with the generated README.

### Tips for Better SEO

### Custom Templates

### Google Analytics

Don't forget to add your Google Analytics code -- if you have one -- to `index.html`:
```html
<!-- Google Analytics -->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'your-google-analytics-id']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
```


## Credits

*   inspired by [DocumentUp](http://documentup.com/)
*   [showdown](https://github.com/coreyti/showdown) for Markdown to HTML conversion
*   [Nunjucks](http://nunjucks.jlongster.com/) for templating
*   [highlight.js](http://softwaremaniacs.org/soft/highlight/) for code syntax highlighting


## License

SublimePelican is licensed under the MIT license.

Copyright (c) 2013, Jui-Shan Liang &lt;jenny@jsliang.com&gt;

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
