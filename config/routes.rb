Rails.application.routes.draw do

  get '/search', :to => 'movies#search'

  post '/movies/:id/favorite', :to => 'movies#favorite'
  post '/movies/:id/watchlist', :to => 'movies#watchlist'
  devise_for :users, :path_names => { :sign_up => "register" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :users
  resources :movies do
    resources :comments
    resources :reviews
  end

end
