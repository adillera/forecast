Rails.application.routes.draw do
  devise_for :users
  root to: 'transactions#index'
  resources :transactions, except: [:show]
  resources :categories, only: [:index, :new, :create, :destroy]
  resources :forecasts, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
