class Item < ActiveRecord::Base
	belongs_to :category

	default_scope order('position ASC')

	acts_as_list :scope => :category
end
