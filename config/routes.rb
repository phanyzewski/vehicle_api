Rails.application.routes.draw do
  resources :vehicles
  resources :vehicle_models
  resources :vehicle_makes
  resources :options
end
