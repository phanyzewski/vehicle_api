Rails.application.routes.draw do

  namespace :v1 do
    resources :vehicles do
      resources :options
    end
    resources :vehicle_models
    resources :vehicle_makes
    resources :options
  end
end
