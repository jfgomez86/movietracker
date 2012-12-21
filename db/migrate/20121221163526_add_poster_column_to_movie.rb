class AddPosterColumnToMovie < ActiveRecord::Migration
  def change
    add_attachment :movies, :poster
  end
end
