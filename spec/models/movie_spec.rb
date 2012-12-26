require 'spec_helper'

describe Movie, "Relations" do
  it { should have_many(:checkins) }
  it { should have_many(:users).through(:checkins) }
end

describe Movie, "Validations" do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:release_date) }

  it "should validate_format_of uri_trailer (invalid)" do
    @movie = Movie.new(FactoryGirl.attributes_for(:movie))
    @movie.uri_trailer = "invalid"
    @movie.should have(1).error_on(:uri_trailer)
  end

  it "should validate_format_of uri_trailer (valid)" do
    @movie = Movie.new(FactoryGirl.attributes_for(:movie))
    @movie.uri_trailer = "ma66u2TSTSY"
    @movie.should have(0).error_on(:uri_trailer)
  end
end