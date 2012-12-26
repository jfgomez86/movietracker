class UserMoviesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = User.find(params[:id])
    @watchlist_movies = @user.movies
  end
end