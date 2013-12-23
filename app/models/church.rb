class Church < ActiveRecord::Base
  validates_presence_of :church_name

  belongs_to :area
end
