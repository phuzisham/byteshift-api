class API::CategoriesController < ApplicationController
  include Response

  def index
		@categories = Store.find(params[:store_id]).categories
		json_response(@categories)
  end

  def show
		@category = Category.find(params[:id])
		json_response(@category)
	end

  def create
		@category = Category.new(cat_params)
		if @category.save
			json_response(@category)
		else
			json_response(@category.errors, status = :not_acceptable)
		end
	end

  def update
    @category = Category.find(params[:id])
    if @category.update(cat_params)
			# Send a 200 response in lieu of the default 204 response to let the server know everything is solid
			head :ok
		else
			# Perhaps specify an error code that we can return in the case a store fails to update?
		end
  end

  def destroy
		@category = Category.find(params[:id])
		if @category.destroy
			# Send a 200 response
			head :ok
		else
			# On the off chance it fails?
		end
	end

private
	def cat_params
		params.permit(:name, :lx, :rx, :ty, :by, :store_id)
	end
end
