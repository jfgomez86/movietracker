class Movie < ActiveRecord::Base
  attr_accessible :title, :synopsis, :release_date
  validates :title, presence: true
  validates :release_date, presence: true

  has_many :checkins
  has_many :users, through: :checkins
end
