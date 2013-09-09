class DevotionsController < ApplicationController
  before_filter :set_active_page
  def index
    
  end

  def show
  end

  protected
  def set_active_page
    session[:current_page] = "devotions"
  end
end
