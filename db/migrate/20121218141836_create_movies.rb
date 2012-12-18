class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.datetime :release_date
      
      t.timestamps
    end
  end
end
