require 'spec_helper'

describe Movie do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:synopsis)}
  it {should validate_presence_of(:release_date)}
end
