class Admin::AreasController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_active_page

  def index
    @areas = Area.all
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_param)

    if @area.save
      flash[:notice] = "Daerah berhasil ditambahkan."

      redirect_to admin_areas_url
    else
      flash[:error] = "Daerah gagal ditambahkan."

      redirect_to new_admin_area_url
    end
  end

  def edit
    @area = Area.find(params[:id])

    if @area.nil?
      flash[:error] = "Area tidak dapat ditemukan."

      redirect_to admin_areas_url
    end
  end

  def update
    @area = Area.find(params[:id])

    if !@area.nil?
      if @area.update_attributes(area_param)
        flash[:notice] = "Area berhasil diupdate."

        redirect_to admin_areas_url
      else
        flash[:error] = "Area gagal diupdate."

        redirect_to edit_admin_area_url(@area.id)
      end
    else
      flash[:error] = "Area tidak dapat ditemukan."

      redirect_to admin_areas_url
    end
  end

  def destroy
    @area = Area.find(params[:id])

    if @area.nil?
      flash[:error] = "Area tidak dapat ditemukan."

      redirect_to admin_areas_url
    else
      @area.destroy

      flash[:notice] = "Area berhasil dihapus."

      redirect_to admin_areas_url
    end
  end

  protected
  def set_active_page
    session[:current_page] = "areas"
  end

  def area_param
    params.require(:area).permit(:area_name)
  end
end