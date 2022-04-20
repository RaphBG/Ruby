Rails.application.routes.draw do
  devise_for :users, :controllers =>{registrations: 'registrations'}
  resources :users
  root "posts#index"
  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
