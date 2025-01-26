Rails.application.routes.draw do
  namespace :api do
    post "webhooks/chat"
    get "webhooks/qr_code"
  end

  resources :ai_agents do
    collection do
      get :models_for_provider
    end
  end

  resources :messages, only: [ :index, :show ]
  resource :session
  resources :passwords, param: :token
  get "dashboard", to: "home#dashboard", as: :dashboard

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
