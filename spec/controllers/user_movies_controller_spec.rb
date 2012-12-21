require 'spec_helper'

describe UserMoviesController, 'Routing' do
      
  it {{get: "/watchlist"}.should route_to(controller: "user_movies",
                                       action: "index")}
end

describe UserMoviesController, 'Actions' do
  render_views
  
  describe "As a logged user" do

    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
    end

    describe "on GET to #index" do
      it "should load a list of movies that a user has watched" do
        get :index
        assigns(:watched_movies).should_not be_nil
      end
      it "should render the user_movies index " do
        get :index
        should render_template(:index)
      end
    end
  end

  describe "As a visitor" do
    describe "on GET to #index" do
      it "should redirect to the login page" do
        get :index
        should redirect_to(new_user_session_path)
      end
    end
  end 
end
