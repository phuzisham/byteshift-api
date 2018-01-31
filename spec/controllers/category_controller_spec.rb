require 'rails_helper'
RSpec.configure do |config|
  config.before(:each) do
    @category = FactoryBot.create(:category)
  end

  config.after(:each) do
    Category.destroy(@category.id) if @category != nil
  end
end

RSpec.describe API::CategoriesController, type: :controller do
  describe 'GET index' do
    it 'has an index through a store that returns a 200 OK response' do
      get :index, params: { store_id: @category.store.id }
      expect(response).to have_http_status(:ok)
    end

    it 'has an index through a store that returns a non-empty list' do
      get :index, params: { store_id: @category.store.id }
      expect(JSON(response.body)).not_to be_empty
    end

    it 'renders error :not_found' do
      Category.destroy_all
      get :index, params: { store_id: @category.store.id }
      @category = nil
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET category' do
    it 'renders the category template' do
      get(:show, params: { id: @category.id, store_id: @category.store.id })
      expect(response).to have_http_status(:ok)
    end

    it 'renders error :not_found' do
      get(:show, params: { id: 'x', store_id: @category.store.id })
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST category' do
    it 'creates category' do
      post(:create, params: { name: 'frozen', lx: '1', rx: '2', ty: '3', by: '4', store_id: @category.store.id })
      expect(response).to have_http_status(:ok)
    end

    it 'saves category to database' do
      post(:create, params: { name: 'frozen', lx: '1', rx: '2', ty: '3', by: '4', store_id: @category.store.id })
      expect(Category.last.name).to eq('Frozen')
    end

    it 'renders error :not_acceptable' do
      post(:create, params: { store_id: @category.store.id })
      expect(response).to have_http_status(:not_acceptable)
    end
  end

  describe 'PATCH category' do
    it 'renders :no_content on success' do
      patch(:update, params: { name: 'new category name', id: @category.id, store_id: @category.store.id })
      expect(response).to have_http_status(:no_content)
    end

    it 'updates store in database' do
      patch(:update, params: { name: 'test category name', id: @category.id, store_id: @category.store.id })
      expect(Category.find(@category.id).name).to eq('Test Category Name')
    end

    it 'renders error :expectation_failed' do
      patch(:update, params: { name: '', id: @category.id, store_id: @category.store.id })
      expect(response).to have_http_status(:expectation_failed)
    end
  end

  describe 'DELETE store' do
    it 'renders :no_content on sucess' do
      delete :destroy, params: { id: @category.id, store_id: @category.store.id }
      @category = nil
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes from the database' do
      delete :destroy, params: { id: @category.id, store_id: @category.store.id }
      expect(Category.last).not_to eq(@category)
      @category = nil
    end
  end
end
