$(document).ready ->
  $("#q").focus().keyup (e) ->
    if e.keyCode is 13
        $('#loader').modal('show')
        getShot()


getShot = ->
  $.ajax '/makeShot',
    type: 'POST'
    dataType: 'json'
    data: { url: $("#q").val() }
    error: (jqXHR, textStatus, errorThrown) ->
      console.log textStatus
    success: (data, textStatus, jqXHR) ->
      console.log "Result: " + data.success
      if data.success is 'true'
        d = new Date();
        $("#result").empty().append('<img src="images/output.png?ver='+ d.getTime() + '" alt="not supported" class="img-rounded">')
        $('#loader').modal('hide')
      else
        $("#result").empty().append('error downloading shot')
        $('#loader').modal('hide')