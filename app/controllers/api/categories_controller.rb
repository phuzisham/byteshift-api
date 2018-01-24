class API::CategoriesController < ApplicationController
  include Response

  def index
    @categories = Store.find(params[:store_id]).categories
    @categories.length > 0 ? json_response(@categories) : (head :not_found)
  end

  def show
    @category = Category.find(params[:id])
    @category ? json_response(@category) : json_response(@category.errors, status = :not_found)
  end

  def create
    @category = Category.new(cat_params)
    @category.save ? json_response(@category) : json_response(@category.errors, status = :not_acceptable)
  end

  def update
    @category = Category.find(params[:id])
    @category.update(cat_params) ? (head :no_content) : (head :expectation_failed)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy ? (head :no_content) : (head :expectation_failed)
  end

  private

  def cat_params
    params.permit(:name, :lx, :rx, :ty, :by, :store_id)
  end
end
