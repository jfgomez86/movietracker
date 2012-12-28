require 'spec_helper'

describe User, "Relations" do
  it { should have_many(:checkins) }
  it { should have_many(:movies).through(:checkins) }
  it { should have_many(:ratings) }
  it { should have_many(:rated_movies).through(:ratings) }
end
