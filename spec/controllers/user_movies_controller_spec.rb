require 'spec_helper'

describe UserMoviesController, 'Routing' do
      
  it {{get: "/user/1/watchlist"}.should route_to(controller: "user_movies",
                                       action: "index", id: "1")}
end

describe UserMoviesController, 'Actions' do
  render_views
  
  describe "As a logged user" do

    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
    end

    describe "on GET to #index" do
      it "should load a list of movies that a user has added." do
        get :index, id: @user.id
        assigns(:watchlist_movies).should_not be_nil
      end
      it "should render the watchlist index " do
        get :index, id: @user.id
        should render_template(:index)
      end
    end
  end

  describe "As a visitor" do
    before do
      @user = FactoryGirl.create(:user)
    end
    describe "on GET to #index" do
      it "should redirect to the login page" do
        get :index, id: @user.id
        should redirect_to(new_user_session_path)
      end
    end
  end 
end