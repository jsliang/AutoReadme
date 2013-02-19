# AutoReadme

**AutoReadme** is an automatic document generator for GitHub projects whose READMEs are written in Markdown.
Documents are always generated at client-side with the newest README file and can be easily hosted anywhere.


## Quick Start

1.  [Download AutoReadme](https://github.com/jsliang/AutoReadme/zipball/master) and extract it to anywhere you like.
2.  Open `index.html` with a browser. When you see a generated README page of AutoReadme, congratulations! You're almost there!
3.  Edit `index.html` and [customize the page](#customization) to fit your project.


## Customization

### Options for jquery.autoreadme.js
```html
<script src="jquery.autoreadme.js"></script>
<script>
$(document).ready(function() {
  $("#container").autoReadme( {
    username: "jsliang",      // GitHub username
    repository: "AutoReadme", // GitHub repository
    filename: "README.md",    // filename of your README
    name: "AutoReadme",       // (optional) repository name to show in the page title
    template: "default"       // (optional) pick a template :P
  } );
});
</script>
```
### Tips for Better SEO

(to be written)

### Custom Templates

(to be written)

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
