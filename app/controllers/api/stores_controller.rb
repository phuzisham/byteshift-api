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
		@store = Store.new(store_params)
		if @store.save
			json_response(@store)
		else
			json_response(@store.errors, status = :not_acceptable)
		end
	end

	def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
			# Send a 200 response in lieu of the default 204 response to let the server know everything is solid
			head :ok
		else
			# Perhaps specify an error code that we can return in the case a store fails to update?
		end
  end

	def destroy
		@store = Store.find(params[:id])
		if @store.destroy
			# Send a 200 response
			head :ok
		else
			# On the off chance it fails?
		end
	end

	private
	def store_params
		params.permit(:name, :address, :phone, :hours)
	end
end
