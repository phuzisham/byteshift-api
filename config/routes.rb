Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :stores do
      resources :categories do
        resources :items
      end
      resources :items
    end
  end
end
