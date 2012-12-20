class CheckinsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @checkin = current_user.checkins.create(movie: @movie)
    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @checkin = current_user.checkins.find(params[:id])
    @checkin.destroy
    redirect_to @movie
  end
end
