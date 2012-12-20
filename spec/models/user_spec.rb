require 'spec_helper'

describe User, "Relations" do
  it { should have_many(:checkins) }
  it { should have_many(:movies).through(:checkins) }
end
