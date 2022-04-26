Rails.application.routes.draw do
  devise_for :users
  resources :profile, only: :show
  root "events#index"
end
