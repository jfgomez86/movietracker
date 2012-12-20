class Checkin < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie
  belongs_to :user

  validates :movie_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
end
