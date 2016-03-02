class Albums < ActiveRecord::Migration
  def change
    create_table(:albums) do |t|
      t.string :title
      t.string :artist
      t.belongs_to :user
    end
  end
end
