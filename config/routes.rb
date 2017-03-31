Rails.application.routes.draw do

  get 'activities/index'

  get '/search', :to => 'movies#search'
  get '/movies/:id/reviews/new', :to => 'reviews#new'
  get '/movies/:id/comments/new', :to => 'comments#new'

  post '/movies/:id/favorite', :to => 'movies#favorite'
  post '/movies/:id/watchlist', :to => 'movies#watchlist'

  devise_for :users, :path_names => { :sign_up => "register" }
  resources :users, :only => [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :users
  resources :movies do
    resources :comments
    resources :reviews
  end

  resources :activities

end
