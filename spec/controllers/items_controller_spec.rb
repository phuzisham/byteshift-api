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
    it 'has an index through a store that returns a 200 OK response' do
      get :index, params: { store_id: @item.store.id }
      expect(response).to have_http_status(:ok)
    end

    it 'has an index through a category that returns a 200 OK response' do
      get :index, params: { store_id: @item.store.id, category_id: @item.category.id }
      expect(response).to have_http_status(:ok)
    end

    it 'has an index through a store that returns a non-empty list' do
      get :index, params: { store_id: @item.store.id }
      expect(JSON(response.body)).not_to be_empty
    end

    it 'has an index through a category that returns a non-empty list' do
      get :index, params: { store_id: @item.store.id, category_id: @item.category.id }
      expect(JSON(response.body)).not_to be_empty
    end

    it 'has show that returns a 200 OK response' do
      get :show, params: { store_id: @item.store.id, id: @item.id }
      expect(response).to have_http_status(:ok)
    end

    it 'has a show that returns a hashed item with the correct @item id' do
      get :show, params: { store_id: @item.store.id, id: @item.id }
      # By parsing the response body I get a hash that represents the @item
      expect(JSON(response.body)['id']).to eq(@item.id)
    end
  end

  describe 'POST Items' do
    context 'An item with proper params is sent to the create route' do
      it 'returns a 200 OK response' do
        cat = Category.last
        post :create, params: { name: '2% Milk', x: 3, y: 4, category_id: cat.id, store_id: cat.store_id }
        expect(response).to have_http_status(:ok)
      end

      it 'returns the newly created item' do
        cat = Category.last
        post :create, params: { name: '99% Milk', x: 3, y: 4, category_id: cat.id, store_id: cat.store_id }
        expect(JSON(response.body)['name']).to eq('99% Milk')
      end
    end

    context 'An item without proper params is sent to the create route' do
      it 'has an index through a store that returns a 406 Not Acceptable response' do
        post :create, params: { name: '2% Milk', x: 3, y: 4, category_id: '', store_id: '' }
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  end

  describe 'PATCH Items' do
    context 'An item with proper params is sent to the update route' do
      it 'returns a 200 OK response' do
        patch :update, params: { name: 'Squeaky Cheese', store_id: @item.store_id, id: @item.id }
        expect(response).to have_http_status(:ok)
      end

      it 'actually makes changes to an item' do
        patch :update, params: { name: 'Cheesesticks', store_id: @item.store_id, id: @item.id }
        new_item_name = Item.find(@item.id).name
        expect(new_item_name).to eq('Cheesesticks')
      end
    end

    context 'An item without proper params is sent to the update route' do
      it 'returns a 417 Expectation Failed response' do
        patch :update, params: { name: '', store_id: @item.store_id, id: @item.id }
        expect(response).to have_http_status(:expectation_failed)
      end
    end
  end
end
