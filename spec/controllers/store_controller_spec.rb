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
end
