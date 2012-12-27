require 'spec_helper'

describe Rating, "Relations" do
  it { should belong_to(:user) }
  it { should belong_to(:movie) }
end

describe Rating, "Validations" do
  subject { FactoryGirl.create(:rating) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:movie_id) }
  it { should validate_uniqueness_of(:movie_id).scoped_to(:user_id) }
  it { should ensure_inclusion_of(:value).in_array(1..10) }
end
