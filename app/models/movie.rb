class Movie < ActiveRecord::Base
  attr_accessible :title, :synopsis, :release_date

  has_many :checkins
  has_many :users, through: :checkins
end
