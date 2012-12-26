class AddColumnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :uri_trailer, :string
  end
end
