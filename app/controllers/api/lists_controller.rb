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
    @list = List.new(list_params)
    @list.save ? json_response(@list) : json_response(@list.errors, status = :not_acceptable)
  end

  # Lists wont change stores or accounts
  # def update
  #
  # end

  def destroy
    @list = List.find(params[:id])
    @list.destroy ? (head :ok) : (head :expectation_failed)
  end

  private

  def list_params
    params.permit(:account_id, :store_id)
  end
end
