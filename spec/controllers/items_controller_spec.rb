require 'rails_helper'

RSpec.configure do |config|
  config.before(:all) do
    # As it turns out, since I called the store and category FactoryBot definition from the Item definition these aren't necessary
    # @store = FactoryBot.create(:store)
    # @category = FactoryBot.create(:category)
    @item = FactoryBot.create(:item)
  end

  config.after(:all) do
    # I see how that fancy database cleaner gem would come in handy here xD
    Store.destroy_all
    Category.destroy_all
    Item.destroy_all
  end
end

RSpec.describe API::ItemsController, type: :controller do
  describe 'GET Items' do
    it 'has a 200 OK response' do
      binding.pry
      get :index, params: { store_id: @item.store.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns a non-empty list' do
      get :index, params: { store_id: @item.store.id }
      expect(JSON(response.body)).not_to be_empty
    end
  end
end
