// Generated by CoffeeScript 1.6.3
(function() {
  var phantom, title;

  phantom = require('phantom');

  title = '';

  module.exports = {
    shot: function(req, res) {
      return phantom.create(function(ph) {
        return ph.createPage(function(page) {
          return page.open(req.body.url, function(status) {
            if (status === "success") {
              console.log("opened: " + req.body.url, status);
              page.evaluate((function() {
                return document.title;
              }), function(result) {
                title = 'Page title is ' + result;
                return console.log(title);
              });
              page.render('public/images/output.png', function() {
                console.log('File write done');
                return res.send('{ "success" : "true" }');
              });
            } else {
              res.send('{ "success" : "false" }');
            }
            return ph.exit();
          });
        });
      });
    }
  };

}).call(this);

/*
//@ sourceMappingURL=makeShot.map
*/
