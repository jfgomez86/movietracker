require 'spec_helper'
describe TopsController, 'Routing' do
  it{{get: "/tops"}.should route_to(controller: "tops", 
                                action: 'index')}
end

describe TopsController, 'Action' do
  render_views

  describe "on GET to #index" do
    it "should load a list of checkin's top five" do
      get :index
      assigns(:checkin_top_5_by_watchlist).should_not be_nil
    end

    it "should load a list of movie's top five" do
      get :index
      assigns(:movies_top_5_by_watchlists).should_not be_nil
    end
  end
end
