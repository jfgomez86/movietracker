require 'spec_helper'

describe MoviesController, "Routing" do
  it {{get: "/"}.should route_to(controller: "movies",
                                 action: "index")}
  it {{get: "/movies"}.should route_to(controller: "movies",
                                       action: "index")}
  it {{get: "/movies/1"}.should route_to(controller: "movies",
                                         action: "show",
                                         id: "1")}
end

describe MoviesController, "Actions" do
  render_views

  describe "As a visitor" do

    describe "on GET to #index" do

      it "should load a list of movies" do
        get :index
        assigns(:movies).should_not be_nil
      end

      it "should render the index template" do
        get :index
        should render_template("movies/index")
      end

    end
      describe "on GET to #show" do
        before do
          @movie = FactoryGirl.create(:movie)
        end

        it "should load a movie into @movie" do
          get :show, id: @movie.to_param
          assigns(:movie).should_not be_nil
        end

        it "should render the index template" do
          get :show, id: @movie.to_param
          should render_template("movies/show")
        end

        describe "as an authenticated user" do
          before do
            @user = FactoryGirl.create(:user)
            sign_in :user, @user
          end

          it "should load a checkin for the movie if it exists" do
            FactoryGirl.create(:checkin, movie: @movie, user: @user)
            get :show, id: @movie.to_param
            assigns(:checkin).should_not be_nil
          end
        end
      end

  end

end
