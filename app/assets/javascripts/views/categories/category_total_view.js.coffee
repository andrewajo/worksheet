class Worksheet.Views.CategoryTotal extends Backbone.View
	template: JST['categories/category_total']

	tagName: 'tr'

	initialize: ->
		@model.on('change', @render, this)

	render: ->
		$(@el).html(@template(category: @model))
		this
