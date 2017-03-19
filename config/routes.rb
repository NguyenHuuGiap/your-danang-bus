Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:create, :new, :edit, :show, :update]

  resources :buses, only: [:index, :show]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  post 'user_location', to: 'user_location#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


