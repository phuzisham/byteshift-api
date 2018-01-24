class API::StoresController < ApplicationController
  include Response

  def index
    @stores = Store.all
    @stores.length > 0 ? json_response(@stores) : (head :not_found)
  end

  def show
    @store = Store.find(params[:id])
    @store ? json_response(@store) : json_response(@store.errors, status = :not_found)
  end

  def create
    @store = Store.new(store_params)
    @store.save ? json_response(@store) : json_response(@store.errors, status = :not_acceptable)
  end

  def update
    # Send a 200 response in lieu of the default 204 response to let the server know everything is solid
    # Perhaps specify an error code that we can return in the case a store fails to update?
    # Return head :no_content because nothing is being transmitted
    @store = Store.find(params[:id])
    @store.update(store_params) ? (head :no_content) : (head :expectation_failed)
  end

  def destroy
    # Return head :no_content because nothing is being transmitted
    @store = Store.find(params[:id])
    @store.destroy ? (head :no_content) : (head :expectation_failed)
  end

  private

  def store_params
    params.permit(:name, :address, :phone, :hours, :id)
  end
end
