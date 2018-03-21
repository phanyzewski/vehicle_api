Rails.application.routes.draw do

  root           to: 'status#index'
  get '/status', to: 'status#index'
  post "/graphql", to: "graphql#execute"

  namespace :v1 do
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

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
end
