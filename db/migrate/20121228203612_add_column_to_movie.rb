class AddColumnToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :average_rating, :float, default: 0.0, nil: false
    add_index :movies, :average_rating
  end
end
