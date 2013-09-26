class AboutController < ApplicationController
  def index
    session[:current_page] = "about"

    @churches = Church.all
  end
end
