class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @rating = current_user.ratings.build(params[:rating])
    @rating.movie_id = params[:movie_id]
    if @rating.save
      flash[:notice] = "Your rating has been saved"
    else
      flash[:alert] = "Your rating could not be saved... "
    end
    redirect_to movie_path(params[:movie_id])
  end

  def update
    @rating = current_user.ratings.find_by_movie_id!(params[:movie_id])
    if @rating.update_attributes(params[:rating])
      flash[:notice] = "Your rating has been updated"
    else
      flash[:alert] = "Your rating could not be updated..."
    end
    redirect_to movie_path(params[:movie_id])
  end
end
