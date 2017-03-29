Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :users
  resources :movies do
    resources :comments
    resources :reviews
  end

end
