Rails.application.routes.draw do
#   root
  root to: 'toppages#index'
  
  # campaigns
  resources :campaigns, only: [:index, :new, :create, :edit, :update, :destroy]
  
  # cuepoints
  resources :cuepoints, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :campaigns, only: [:index]
  end
  get 'results', to: 'results#index'
  get 'results/record'
end