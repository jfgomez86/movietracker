class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @checkin = current_user.checkins.
      where(movie_id: @movie.id).first if user_signed_in?
  end
end
