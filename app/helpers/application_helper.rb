module ApplicationHelper
  def active_link(page)
    if !session[:current_page].blank? && session[:current_page] == page
      "active"
    else
      ""
    end
  end
end
