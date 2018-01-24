class API::ListsController < ApplicationController
  include Response

  # Retrieve an individual users lists
  def index
    user = Account.find(params[:account_id])
    @lists = user.lists
    json_response(@lists)
  end
end
