class HomeController < ApplicationController
  before_filter :get_devotions

  def index
    session[:current_page] = "home"
    @events = Event.find(:all, :order => "event_date DESC", :limit => 3)
  end

  protected

  def get_devotions
    require 'rss'
    require 'open-uri'

    url = 'http://getmorestrength.org/rssfeed/'
    begin
      open(url) do |rss|
        @feed = RSS::Parser.parse(rss)
        #puts "Title: #{feed.channel.title}"
        #feed.items.each do |item|
        #  puts "Item: #{item.title}"
        #end
      end
    rescue
      @feed = []
    end
  end
end
