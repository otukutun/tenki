class AddPrefectureIdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :prefecture_id, :integer
  end
end
