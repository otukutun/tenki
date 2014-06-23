class TenkiFeed < ActiveRecord::Base
  #validates :location_id, presence: true
  #validates :time, presence: true
  belongs_to :city, :dependent => :destroy
  belongs_to :prefecture, :dependent => :destroy

end
