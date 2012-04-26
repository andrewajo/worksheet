class ItemsController < ApplicationController
	respond_to :json
	
	def index
		respond_with Item.all
	end

	def show
		respond_with Item.find(params[:id])
	end

	def create
		respond_with Item.create(params[:item])
	end

	def update
		respond_with Item.update(params[:id], params[:item])
	end

	def destroy
		respond_with Item.destroy(params[:id])
	end

	def sort
	  params[:item].each_with_index do |id, index|
	    Item.update_all({position: index+1}, {id: id})
	  end
	  render nothing: true
	end
end
