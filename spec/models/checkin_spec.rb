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
end
