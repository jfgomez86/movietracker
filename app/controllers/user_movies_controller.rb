class UserMoviesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @watched_movies = current_user.movies if user_signed_in?
  end
end
