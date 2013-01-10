class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.string :artist
      t.string :track_name

      t.timestamps
    end

    add_index :videos, [:youtube_id], unique: true
  end
end
