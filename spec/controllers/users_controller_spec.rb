require 'spec_helper'

describe UsersController, 'Routing' do
  it {{get: "/users"}.should route_to(controller: "users", action: "index")}
end

describe UsersController, 'Actions' do
  render_views

  describe "As a logged user" do
    
    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
    end

    describe "On GET to #index" do
      it "should load a list of all user except the current user" do
        get :index
        assigns(:users).should_not be_nil
        assigns(:users).should_not include(@user)
      end
      it "should render the users index" do
        get :index
        should render_template(:index)
      end
    end
  end

  describe "As a visitor" do
      describe "On GET to #index" do
      it "should render the users index" do
        get :index
        should redirect_to(new_user_session_path)
      end
    end
  end
end
