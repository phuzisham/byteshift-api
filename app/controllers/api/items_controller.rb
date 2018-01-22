class API::ItemsController < ApplicationController
  include Response

  def index
    # Finds a category if the params exist
    category = Category.find(params[:category_id]) if params[:category_id]
    # If the category is found then it grabs the items from that category otherwise is defaults to using the store to find its items!
    @products = category ? category.items : Store.find(params[:store_id]).items
    json_response(@products)
  end

  def create
    @item = Item.new(item_params)
		@item.save ? json_response(@item) : json_response(@item.errors, status = :not_acceptable)
  end

  def show
    @item = Item.find(params[:id])
    @item ? json_response(@item) : json_response(@item.errors, status = :not_found)
  end

  def update
    @item = Item.find(params[:id])
    # Send a 200 response in lieu of the default 204 response to let the server know everything is solid
    # Perhaps specify an error code that we can return in the case a store fails to update?
    @item.update(item_params) ? (head :ok) : (head :expectation_failed)
  end

  private
  def item_params
    params.permit(:name, :x, :y, :store_id, :category_id)
  end
end
