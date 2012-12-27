require 'spec_helper'

describe Checkin, "Relations" do
  it { should belong_to(:user) }
  it { should belong_to(:movie) }
end

describe Checkin, "Validations" do
  subject { FactoryGirl.create(:checkin) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:movie_id) }
  it { should validate_uniqueness_of(:movie_id).scoped_to(:user_id) }
  
  it "should return a hash not null with list of top five more checkin" do
    FactoryGirl.create(:checkin)
    Checkin.top_5.should_not be_nil
  end

  it "should return a hash with list of top five more checkin empty" do
    Checkin.top_5.should be_empty
  end

  it "should return a hash with list of top five more checkin" do
    a = FactoryGirl.create(:movie)
    b = FactoryGirl.create(:checkin, movie_id: a.id)
    Checkin.top_5.should eq({a.id => 1})
  end
end
