require 'spec_helper'

describe Movie, "Relations" do
  it { should have_many(:checkins) }
  it { should have_many(:users).through(:checkins) }
end
