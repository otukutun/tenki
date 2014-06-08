class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :prefecture
      t.string :city
      t.integer :city_id
      t.string :url

      t.timestamps
    end
  end
end
