Rails.application.routes.draw do
  devise_for :users, :controllers =>{registrations: 'registrations'}
  resources :users
  devise_scope :user do
    get '/users' => 'devise/sessions#destroy'
  end
  root "posts#index"
  resources :posts do
    resources :comments
  end
end
