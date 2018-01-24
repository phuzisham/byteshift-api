require 'rails_helper'
RSpec.configure do |config|
  config.before(:each) do
    @store = FactoryBot.create(:store)
  end

  config.after(:each) do
    Store.destroy(@store.id) if @store != nil
  end
end

RSpec.describe API::StoresController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders error :not_found' do
      Store.destroy_all
      @store = nil
      get :index
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET store' do
    it 'renders the store template' do
      get(:show, params: { id: @store.id })
      expect(response).to have_http_status(:ok)
    end

    it 'renders error :not_found' do
      get(:show, params: { id: 'x' })
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST store' do
    it 'creates store' do
      post(:create, params: { name: 'Freddy Macs', address: '1342 s waterfront, portland, or 97201', phone: '5035552244', hours: 'all week long' })
      expect(response).to have_http_status(:ok)
    end

    it 'renders error :not_acceptable' do
      post(:create, params: { })
      expect(response).to have_http_status(:not_acceptable)
    end
  end

  describe 'PATCH store' do
    it 'renders :no_content on success' do
      patch(:update, params: { name: 'new store name', id: @store.id })
      expect(response).to have_http_status(:no_content)
    end

    it 'updates store in database' do
      patch(:update, params: { name: 'test store name', id: @store.id })
      expect(Store.find(@store.id).name).to eq('Test Store Name')
    end

    it 'renders error :expectation_failed' do
      patch(:update, params: { name: '', id: @store.id })
      expect(response).to have_http_status(:expectation_failed)
    end
  end

  describe 'DELETE store' do
    it 'renders :no_content on sucess' do
      delete :destroy, params: { id: @store.id }
      @store = nil
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes from the database' do
      delete :destroy, params: { id: @store.id }
      expect(Store.last).not_to eq(@store)
      @store = nil
    end
  end
end
