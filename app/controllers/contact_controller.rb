class ContactController < ApplicationController
  before_filter :set_active_page
  def index
    
  end

  protected
  def set_active_page
    session[:current_page] = "contact"
  end
end
