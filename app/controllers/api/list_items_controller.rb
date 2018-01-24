class API::ListItemsController < ApplicationController
  include Response

  def index
    list = List.find(params[:list_id])
    @list_items = list.list_items
    json_response(@list_items)
  end
end
