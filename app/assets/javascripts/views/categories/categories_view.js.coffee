class Worksheet.Views.CategoriesIndex extends Backbone.View
  template: JST['categories/categories']

  events:
    'submit #new_category': 'createCategory'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendCategory, this)

  render: ->
    $(@el).html(@template(categories: @collection))
    @collection.each(@appendCategory)
    @$('table tbody').attr('data-update-url', '/api/items/sort')
    @$('#items').sortable(
      helper: fixHelper
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
        console.log($(this.sortable('serialize')))
    )
    this

  appendCategory: (category) ->
    view = new Worksheet.Views.Category(model: category)
    $('#categories').append(view.render().el)

  createCategory: (event) ->
    event.preventDefault()
    @collection.create name: $('#new_category_name').val()
    $('#new_category')[0].reset()

  fixHelper = (e, tr) ->
    $originals = tr.children()
    $helper = tr.clone()
    $helper.children().each (index) ->
      $(this).width $originals.eq(index).width()
    $helper