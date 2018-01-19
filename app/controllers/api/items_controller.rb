class API::ItemsController < ApplicationController
  include Response

  def index
    @items = params[:category_id] ? Item.where(category_id: params[:category_id]) : Item.where(store_id: params[:store_id])
    json_response(@items)
  end
end
