class Movie < ActiveRecord::Base
  attr_accessible :title, :synopsis, :release_date
  validates :title, presence: true
  validates :release_date, presence: true

  has_many :checkins
  has_many :users, through: :checkins

  has_attached_file :poster,
            :styles => { :medium => "256x320>", :thumb => "128x140>" },
            :url => "/assets/posters/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/posters/:id/:style/:basename.:extension"
  validates_attachment :poster,
            :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"]  },
            :size => { :less_than => 3.megabytes }

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
