class Worksheet.Views.Category extends Backbone.View
  template: JST['categories/category']

  initialize: ->
    @model.on('destroy', @remove, this)
    @model.items.on('change', @renderTotals, this)

  events:
    'click .icon-remove.category' : 'deleteCategory'
    'click .icon-plus' : 'addItem'


  render: ->
    @renderCategory()
    @renderItems()
    @renderTotal()
    this

  renderCategory: ->
    $(@el).html(@template(category: @model))

  renderItems: ->
    $items = @$('.items')
    @model.items.each (item) ->
      itemView = new Worksheet.Views.Item(model: item)
      $items.append(itemView.render().el)

  renderTotal: ->
    $items = @$('.items')
    totalView = new Worksheet.Views.CategoryTotal(model: @model)
    $items.append(totalView.render().el)


  deleteCategory: ->
    @model.destroy()


  addItem: ->
    view = new Worksheet.Views.ItemsNew(model: @model)
    @$('tbody').append(view.render().el)