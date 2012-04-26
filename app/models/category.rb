class Category < ActiveRecord::Base
	has_many :items

	accepts_nested_attributes_for :items

	attr_reader :pax_total

	def pax_total
		self.items.pax_total.sum
	end
end
