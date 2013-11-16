class Event < ActiveRecord::Base
  has_attached_file :event_picture, :styles => { :medium => "370x266>", :thumb => "100x100>", :big => "770x554>" }
end
