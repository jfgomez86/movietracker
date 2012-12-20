Movietracker::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :movies, only: [:index, :show] do
    resources :checkins, only: [:create]
  end

  root to: "movies#index"
end
