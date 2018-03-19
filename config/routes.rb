Rails.application.routes.draw do

  root           to: 'status#index'
  get '/status', to: 'status#index'

  namespace :v1 do
    resources :options
    resources :vehicles do
      resources :options
    end

    resources :vehicle_makes do
      resources :vehicles, only: [:index, :show]
      resources :vehicle_models, only: [:index, :show]
    end

    resources :vehicle_models do
      resources :vehicles, only: [:index, :show]
      resources :options
    end
  end
end
