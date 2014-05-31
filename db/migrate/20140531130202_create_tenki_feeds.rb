class CreateTenkiFeeds < ActiveRecord::Migration
  def change
    create_table :tenki_feeds do |t|
      t.integer :location_id
      t.string :location_name
      t.time :time
      t.integer :user_id

      t.timestamps
    end
  end
end
