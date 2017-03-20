Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:create, :new, :edit, :show, :update]

  get 'map', to: 'map#index'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  post 'user_location', to: 'user_location#create'

  namespace :api do
    post 'login', to: 'access_token#create'
    resources :users do
      member do
        post :register
        post :update_profile
      end
    end
    resources :buses, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


