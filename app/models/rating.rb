class Rating < ActiveRecord::Base
  attr_accessible :value, :movie_id, :user_id
  after_save :update_movie_average_rating

  belongs_to :user
  belongs_to :movie

  RATINGS = 1..10

  validates :movie_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
  validates :value, inclusion: { in: RATINGS }

  def update_movie_average_rating
    movie.update_attribute(:average_rating, movie.ratings.average(:value).to_f)
  end
end
