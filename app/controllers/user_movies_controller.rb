class UserMoviesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @watched_movies = current_user.movies
  end
end
