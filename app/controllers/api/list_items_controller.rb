class API::ListItemsController < ApplicationController
  include Response

  def index
    list = List.find(params[:list_id])
    @list_items = list.list_items
    json_response(@list_items)
  end

  # Not sure we need a show?
  # It could be a link to the actual item to eliminate redundancy
  # def show
  #
  # end

  def create
    list = List.find(params[:list_id])
    @list_item = list.list_items.new(list_items_params)
    @list_item.save ? json_response(@list_item) : json_response(@list_item.errors, status = :not_acceptable)
  end

  private

  def list_items_params
    params.permit(:list_id, :item_id, :name)
  end
end
