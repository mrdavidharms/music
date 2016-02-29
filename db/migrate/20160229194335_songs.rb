class Songs < ActiveRecord::Migration
  def change
    drop_table(:songs) do |t|
    t.string :title
    t.string :artist
    t.string :album
    t.integer :year
    t.integer :track_number
    t.string :genre
    t.integer :length_in_seconds
    t.string :image
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
    end
  end
end
