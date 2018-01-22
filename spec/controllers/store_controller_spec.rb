require 'rails_helper'

RSpec.describe API::StoresController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET store' do
    it 'renders the store template' do
      store = FactoryBot.create(:store)
      get(:show, params: { id: store.id })
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST store' do
    it 'creates store' do
      post(:create, params: { name: 'Freddy Macs', address: '1342 s waterfront, portland, or 97201', phone: '5035552244', hours: 'all week long' })
      expect(response).to have_http_status(:ok)
    end
  end
end
