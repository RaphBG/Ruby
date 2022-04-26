Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :profile, only: :show
  post "attend/:id", to: "attends#new", as: "attend"
  delete "attend/:id", to: "attends#destroy", as: "attend_destroy"
  root "events#index"
end
