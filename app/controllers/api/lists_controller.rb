class API::ListsController < ApplicationController
  # Implement auth on these
  include Response

  # Retrieve an individual users lists
  def index
    user = Account.find(params[:account_id])
    @lists = user.lists
    json_response(@lists)
  end

  def show
    @list = List.find(params[:id])
    json_response(@list)
  end

  def create
    @list.new(list_params)
    @list.save ? json_response(@list) : json_response(@list.errors, status = :not_acceptable)
  end

  private

  def list_params
    params.permit(:account_id, :store_id)
  end
end
