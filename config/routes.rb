require 'devise_token_auth'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    mount_devise_token_auth_for 'User',
                                at: 'auth',
                                controllers: {
                                  registrations:  'api/registrations'
                                },
                                skip: %i[sessions]

    resources :accounts, except: %i[index create destroy] do
      resources :lists, except: [:update] do
        # TODO: override url path from list_items to show as items
        resources :list_items, except [:update]
      end
    end

    resources :stores do
      resources :categories do
        resources :items
      end
      resources :items
    end
  end
end
