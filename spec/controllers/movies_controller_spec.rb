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
      end

  end

end
