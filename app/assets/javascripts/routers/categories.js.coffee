class Worksheet.Routers.Categories extends Backbone.Router
  routes:
    '': 'index'
    'categories/:id': 'show'

  initialize: ->
    @collection = new Worksheet.Collections.Categories()
    @collection.fetch()
                
  index: ->
    view = new Worksheet.Views.CategoriesIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Category #{id}"