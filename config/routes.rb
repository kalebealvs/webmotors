Rails.application.routes.draw do
  root to: "home#index"

  resources :models, only: :index
end
