Movietracker::Application.routes.draw do
  devise_for :users

  root to: "movie#index"
end
