class API::ItemsController < ApplicationController
  include Response

  def index
<<<<<<< HEAD
    @items = params[:category_id] ? Item.where(category_id: params[:category_id]) : Item.where(store_id: params[:store_id])
    json_response(@items)
=======
    # Finds a category if the params exist
    category = Category.find(params[:category]) if params[:category_id]
    # If the category is found then it grabs the items from that category otherwise is defaults to using the store to find its items!
    @products = category ? category.items : Store.find(params[:store_id]).items
    json_response(@products)
>>>>>>> items_controller
  end
end
