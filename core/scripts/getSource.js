var page = require('webpage').create();
var fs = require('fs');
var system = require('system').args;

var URL = system[1];
var path_name = system[2];

page.viewportSize = { width: 1920, height: 1080 };
page.open(URL, function(status) {
  if (status !== 'success') {
    console.log('Unable to access network');
  } else {
    var ua = page.evaluate(function() {
      return document.getElementsByTagName('html')[0].innerHTML;
    });
    try {
      fs.write(path_name + ".html", ua);
    } catch(e) {
      console.log(e);
    }

    page.render(path_name + '.jpeg', {format: 'jpeg', quality: '100'});
  }
  phantom.exit();
});