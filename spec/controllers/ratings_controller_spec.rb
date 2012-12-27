require 'spec_helper'

describe RatingsController, "Routing" do
  it {{post: "/movies/1/ratings"}.should route_to(controller: "ratings",
                                                   action: "create",
                                                   movie_id: "1") }
  it {{put: "/movies/1/ratings/1"}.should route_to(controller: "ratings",
                                                    action: "update",
                                                    id: "1",
                                                    movie_id: "1")}
end

describe RatingsController, "Actions" do
  render_views

  before do
    @movie = FactoryGirl.create(:movie)
  end

  describe "as an authenticated user" do

    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
    end

    describe "on POST to #create" do
      
      it "should create a new rating on the given movie by the current_user" do
        expect {
          post :create, rating: {value: 5}, movie_id: @movie.id
        }.to change(@user.reload.ratings, :count).by(1)
      end

      it "should redirect to the movie page" do
        post :create, movie_id: @movie.id
        should redirect_to @movie
      end
    end

    describe "on PUT to #update" do

      before do
        @rating = FactoryGirl.create(:rating, user: @user, movie: @movie, value: 10)
        put :update, {
          id: @rating.id,
          movie_id: @movie.id,
          rating: {value: 1}
        }
      end

      it "should update the rating for the given movie by the current_user" do
        @rating.reload.value.should eql(1)
      end

      it "should redirect to the movie page" do
        should redirect_to @movie
      end

    end

  end

  describe "as a visitor" do
    
    describe "on POST to #create" do
      it "should be redirected to the log in page" do
        post :create, movie_id: @movie.id
        should redirect_to(new_user_session_path)
      end
    end

    describe "on PUT to #update" do
      it "should be redirected to the log in page" do
        put :update, id: 1, movie_id: @movie.id
        should redirect_to(new_user_session_path)
      end
    end

  end

end
