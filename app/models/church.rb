class Church < ActiveRecord::Base
  validates_presence_of :church_name
end
