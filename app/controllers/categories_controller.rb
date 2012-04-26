class CategoriesController < ApplicationController
	respond_to :json

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def create
		respond_with Category.create(params[:category])
	end

	def update
		respond_with Category.update(params[:id], params[:category])
	end

	def destroy
		respond_with Category.destroy(params[:id])
	end
end
