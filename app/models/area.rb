class Area < ActiveRecord::Base
  validates_presence_of :area_name
  validates_uniqueness_of :area_name
end
