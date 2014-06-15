class TenkiFeed < ActiveRecord::Base
  #validates :location_id, presence: true
  #validates :time, presence: true
  belongs_to :city, depentent: true
  belongs_to :prefecture, depentent: true
end
