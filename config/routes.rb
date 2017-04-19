Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
      omniauth_callbacks: 'omniauth_callbacks',
      registrations: 'users',
      sessions: 'sessions'
  }, path_names: {
      sign_in: 'login', sign_out: 'log_out'
  }

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
    get 'login', to: 'sessions#new'
  end

  get 'map', to: 'map#index'

  post 'user_location', to: 'user_location#create'

  namespace :api do
    post 'login', to: 'access_token#create'

    resources :users do
      collection do
        post :register
        patch :update_profile
      end
    end

    resources :routes, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


