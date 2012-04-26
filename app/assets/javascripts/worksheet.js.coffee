window.Worksheet =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Worksheet.Routers.Categories
    Backbone.history.start()
$(document).ready ->
  Worksheet.init()
