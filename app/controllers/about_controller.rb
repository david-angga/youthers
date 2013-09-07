class AboutController < ApplicationController
  def index
    session[:current_page] = "about"
  end
end
