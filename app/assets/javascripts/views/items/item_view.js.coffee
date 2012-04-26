class Worksheet.Views.Item extends Backbone.View

  template: JST['items/item']

  initialize: ->
    @model.on('destroy', @remove, this)
    @model.on('change', @render, this)
    $(@el).attr 'id', 'item_' + @model.id

  events:
  	'click .icon-remove' : 'deleteItem', 'dblclick td' : 'editItem', 'submit #edit_item' : 'updateItem'

  tagName: 'tr'

  render: ->
  	$(@el).html(@template(item: @model))
  	this

  deleteItem: ->
  	@model.destroy()

  editItem: ->
    $(@el).addClass('editing')
    @$('input.description').focus()

  updateItem: ->
    event.preventDefault()
    @model.save({
      name: @$('#edit_item_name').val(),
      pax: @$('#edit_item_pax').val(),
      units: @$('#edit_item_units').val(),
      unit_cost: @$('#edit_item_unit_cost').val(),
      tax_one: @$('#edit_item_tax_one').val(),
      tax_two: @$('#edit_item_tax_two').val(),
      gratuity_rate: @$('#edit_item_gratuity_rate').val(),
      markup_amount: @$('#edit_item_markup_amount').val()
    })
    $(@el).removeClass('editing')
