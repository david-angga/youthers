class Admin::ChurchesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_active_page

  def index
    @churches = Church.all
  end

  def new
    @church = Church.new
  end

  def create
    @church = Church.new(church_param)

    if @church.save
      flash[:notice] = "Gereja berhasil ditambahkan."

      redirect_to admin_churches_url
    else
      flash[:error] = "Gereja gagal ditambahkan."

      redirect_to new_admin_church_url
    end
  end

  protected
  def set_active_page
    session[:current_page] = "churches"
  end

  def church_param
    params.require(:church).permit(:church_name, :church_address, :church_phone, :church_city, 
      :church_province, :youth_leader, :youthers_count, :daerah, :wilayah, :address_allowed)
  end
end