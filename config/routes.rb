Movietracker::Application.routes.draw do
  devise_for :users

  resources :movies, only: [:index, :show]

  root to: "movies#index"
end
