class API::ItemsController < ApplicationController
  include Response

  def index
    # Finds a category if the params exist
    category = Category.find(params[:category_id]) if params[:category_id]
    # If the category is found then it grabs the items from that category otherwise is defaults to using the store to find its items!
    @products = category ? category.items : Store.find(params[:store_id]).items
    json_response(@products)
  end
end
