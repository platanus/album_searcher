class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :url
      t.string :art
      t.string :tags
      t.string :mbid

      t.timestamps
    end
  end
end
