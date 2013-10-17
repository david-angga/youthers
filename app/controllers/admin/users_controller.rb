class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_active_page

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save 
      flash[:notice] = "User berhasil dibuat"

      redirect_to admin_users_url
    else
      flash[:error] = "User gagal dibuat: #{@user.errors.full_messages.first}"

      redirect_to new_admin_user_url
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to admin_users_url
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to admin_users_url
    else
      if @user.update_attributes(user_param)
        flash[:notice] = "User berhasil diupdate"

        redirect_to admin_users_url
      else
        flash[:error] = "User gagal dibuat: #{@user.errors.full_messages.first}"

        redirect_to edit_admin_user_url(@user.id)
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to admin_users_url
    elsif @user != current_user
      @user.destroy
      flash[:notice] = "User berhasil dihapus"

      redirect_to admin_users_url
    else
      redirect_to admin_users_url
    end
  end

  protected
  def set_active_page
    session[:current_page] = "users"
  end

  def user_param
    params.require(:user).permit(:avatar, :fullname, :email, :password, :password_confirmation, 
      :is_admin, :is_crew, :position, :description, :facebook_acc, :twitter_acc)
  end
end