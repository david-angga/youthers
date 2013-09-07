class HomeController < ApplicationController
  def index
    session[:current_page] = "home"
  end
end
