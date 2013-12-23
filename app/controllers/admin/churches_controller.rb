class Admin::ChurchesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_active_page
  before_filter :load_areas, :only => [:new, :edit, :index]

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

  def edit
    @church = Church.find(params[:id])

    if @church.nil?
      flash[:error] = "Gereja tidak dapat ditemukan."

      redirect_to admin_churches_url
    end
  end

  def update
    @church = Church.find(params[:id])

    if !@church.nil?
      if @church.update_attributes(church_param)
        flash[:notice] = "Gereja berhasil diupdate."

        redirect_to admin_churches_url
      else
        flash[:error] = "Gereja gagal diupdate."

        redirect_to edit_admin_church_url(@church.id)
      end
    else
      flash[:error] = "Gereja tidak dapat ditemukan."

      redirect_to admin_churches_url
    end
  end

  def destroy
    @church = Church.find(params[:id])

    if @church.nil?
      flash[:error] = "Gereja tidak dapat ditemukan."

      redirect_to admin_churches_url
    else
      @church.destroy

      flash[:notice] = "Gereja berhasil dihapus."

      redirect_to admin_churches_url
    end
  end

  protected
  def set_active_page
    session[:current_page] = "churches"
  end

  def church_param
    params.require(:church).permit(:church_name, :church_address, :church_phone, :church_city, 
      :church_province, :youth_leader, :youthers_count, :daerah, :wilayah, :address_allowed, :area_id)
  end

  def load_areas
    @areas = Area.all
  end
end