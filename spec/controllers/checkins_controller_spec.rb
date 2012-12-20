require 'spec_helper'

describe CheckinsController, "Routing" do
  it {{post: "/movies/1/checkins"}.should route_to(controller: "checkins",
                                                   action: "create",
                                                   movie_id: "1") }
end

describe CheckinsController, "Actions" do
  render_views

  before do
    @user = FactoryGirl.create(:user)
    @movie = FactoryGirl.create(:movie)
  end

  describe "as an authenticated user" do

    before do
      sign_in :user, @user
    end

    describe "on POST to #create" do

      it "should create a new check-in on the given movie by the current_user" do
        expect {
          post :create, movie_id: @movie.to_param
        }.to change(@user.reload.checkins, :count).by(1)
      end

      it "should redirect to the movie page" do
        post :create, movie_id: @movie.to_param
        should redirect_to(movie_path(@movie))
      end
    end

    describe "on DELETE to #destroy" do
      it "should delete an existing checkin for a given user"
    end

  end

  describe "as a visitor" do

    it "should redirect to the log in page" do
      post :create, movie_id: @movie.to_param
      should redirect_to(new_user_session_path)
    end
  end
end
