Rails.application.routes.draw do

  root           to: 'status#index'
  get '/status', to: 'status#index'

  namespace :v1 do
    resources :options

    resources :vehicle_makes do
      resources :vehicle_models, only: [:index, :show]
    end

    resources :vehicle_models do
      resources :options, only: [:index, :show, :create]
      resources :vehicles, only: [:index, :show]
    end

    resources :vehicles do
      resources :options
    end
  end
end
