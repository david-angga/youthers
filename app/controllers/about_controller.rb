class AboutController < ApplicationController
  def index
    session[:current_page] = "about"

    @churches = Church.all
    @areas = Area.all

    @users = User.where("is_crew = true")
  end
end
