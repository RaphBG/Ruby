Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :profile, only: :show
  root "events#index"
end
