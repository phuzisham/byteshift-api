class API::StoresController < ApplicationController
	include Response

	def index
		@stores = Store.all
		json_response(@stores)
  end

	def show
		@store = Store.find(params[:id])
		json_response(@store)
	end

	def create
		@store = Store.create(store_params)
		json_response(@store)
	end

	private	
	def store_params
		params.permit(:name, :address, :phone, :hours)
	end
end
