class Movie < ActiveRecord::Base
  attr_accessible :title, :synopsis, :release_date
end
