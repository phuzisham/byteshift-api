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
end
