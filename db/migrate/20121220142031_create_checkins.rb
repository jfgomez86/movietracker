class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :user
      t.references :movie

      t.timestamps
    end

    add_index "checkins", [:user_id, :movie_id]
  end
end
