class MofidyTenkiFeeds < ActiveRecord::Migration
  def change
    change_table :tenki_feeds do |tf|
      tf.integer :city_id
      tf.rename :location_id, :prefecture_id
    end
  end
end
