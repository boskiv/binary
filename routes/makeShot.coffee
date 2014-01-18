phantom = require 'phantom'
title = '';
module.exports =
 shot: (req,res) ->
   phantom.create (ph) ->
     ph.createPage (page) ->
       page.open req.body.url, (status) ->
         if status is "success"
            console.log "opened: " + req.body.url , status
            page.evaluate (-> document.title), (result) ->
                title = 'Page title is ' + result
                console.log title
            # render page to file with callback
            page.render('public/images/output.png', () ->
                console.log 'File write done'
                res.send '{ "success" : "true" }'
            )
         else
            res.send '{ "success" : "false" }'

         ph.exit()
