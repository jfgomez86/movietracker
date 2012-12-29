class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :full_name, :email, :password, :password_confirmation, :remember_me

  has_many :checkins
  has_many :movies, through: :checkins

  has_many :ratings
  has_many :rated_movies, through: :ratings, source: :movie
end
