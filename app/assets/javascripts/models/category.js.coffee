class Worksheet.Models.Category extends Backbone.Model
  initialize: ->
    @on("change:items", this.parseItems)
    @parseItems()

  parseItems: ->
    @items = new Worksheet.Collections.Items(@get('items'))