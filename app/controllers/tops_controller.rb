class TopsController < ApplicationController
  def index
    @checkin_top_5_by_watchlist = Checkin.top_5
    @movies_top_5_by_watchlists = Movie.find(@checkin_top_5_by_watchlist.keys)
  end
end
