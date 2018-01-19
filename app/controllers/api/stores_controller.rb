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

	private
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
