Rails.application.routes.draw do
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :vehicles do
      resources :options
    end
    resources :vehicle_models
    resources :vehicle_makes
    resources :options
  end
end
