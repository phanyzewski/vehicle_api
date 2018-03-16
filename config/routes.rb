Rails.application.routes.draw do
  resources :vehicles do
    resources :options
  end
  # resources :vehicle_make
  # resources :vehicle_model
end
