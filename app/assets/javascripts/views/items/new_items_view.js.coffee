class Worksheet.Views.ItemsNew extends Backbone.View

  template: JST['items/new']

  events:
  	'submit #new_item' : 'createItem'

  tagName: 'tr'
  className: 'itemform'

  render: ->
  	$(@el).html(@template())
  	this

  createItem: (event) ->
  	event.preventDefault()
  	newItem = @model.items.create({
      name: @$('#item_name').val(),
      pax: @$('#item_pax').val(),
      units: @$('#item_units').val(),
      unit_cost: @$('#item_unit_cost').val(),
      tax_one: @$('#item_tax_one').val(),
      tax_two: @$('#item_tax_two').val(),
      gratuity_rate: @$('#item_gratuity_rate').val(),
      markup_amount: @$('#item_markup_amount').val(),
  	  category_id: @model.id
    })
    newItemView = new Worksheet.Views.Item(model: newItem)
    $(@el).parent().append(newItemView.render().el)
  	this.remove()