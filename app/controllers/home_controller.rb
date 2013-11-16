class HomeController < ApplicationController
  def index
    session[:current_page] = "home"
    @events = Event.find(:all, :order => "event_date DESC", :limit => 3)
  end
end
