object @category

attributes :name, :id
node(:pax_total) { |category|
	@items = category.items.all
	total = 0
	@items.each do |i|
		total = total + i.pax
	end
	total
 }

child :items do
	attributes :name, :id, :pax, :units, :unit_cost, :tax_one, :tax_two, :gratuity_rate, :mark_up_amount
end