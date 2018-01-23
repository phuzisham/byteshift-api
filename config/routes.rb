require 'devise_token_auth'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations:  'api/registrations'
    }
    resources :stores do
      resources :categories do
        resources :items
      end
      resources :items
    end
  end
end
