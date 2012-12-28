Movietracker::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :movies, only: [:index, :show] do
    resources :checkins, only: [:create, :destroy]
    resources :ratings, only: [:create, :update]
  end

  get "user/:id/watchlist", to: 'user_movies#index', as: :watchlist
  get "tops", to: 'tops#index', as: :tops 

  root to: "movies#index"

  get 'users', to: 'users#index', as: :users
end
