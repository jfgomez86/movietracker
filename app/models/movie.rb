class Movie < ActiveRecord::Base
  attr_accessible :title, :synopsis, :release_date
  validates_presence_of :title, :release_date

  has_many :checkins
  has_many :users, through: :checkins
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
end
end
