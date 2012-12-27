require 'spec_helper'

describe Movie, "Relations" do
  it { should have_many(:checkins) }
  it { should have_many(:users).through(:checkins) }
  it { should have_many(:ratings) }
  it { should have_many(:raters).through(:ratings) }
end

describe Movie, "Validations" do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:release_date) }
end

describe Movie, "Methods" do
  it "should calculates the average for the given movie" do
    @movie = FactoryGirl.create(:movie)
    FactoryGirl.create(:rating, user_id: 1, movie: @movie, value: 10)
    FactoryGirl.create(:rating, user_id: 2, movie: @movie, value: 5)
    @movie.average_rating.should eql(7.5)
  end
end
