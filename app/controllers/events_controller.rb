class EventsController < ApplicationController
  before_filter :set_active_page
  before_filter :authenticate_user!, :only => [:index_admin, :new, :create, :edit, :update, :destroy]

  def index
    @events = Event.find(:all, :order => "event_date DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def index_admin
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event_params[:event_date] = DateTime.parse(event_params[:event_date])
    @event = Event.new(event_params)
    if @event.save 
      flash[:notice] = "Event berhasil dibuat"
      redirect_to admin_events_url
    else
      flash[:error] = "Event gagal dibuat: #{@event.errors.full_messages.first}"
      redirect_to new_event_url
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to admin_event_url
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to admin_event_url
    end

    if @event.update_attributes(event_params)
      flash[:notice] = "Event berhasil di update"
      redirect_to admin_events_url
    else
      flash[:error] = "Event gagal diupdate: #{@event.errors.full_messages.first}"
      redirect_to edit_event_url(event.id)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to admin_event_url
    end

    if @event.destroy 
      flash[:notice] = "Event berhasil dihapus"
      redirect_to admin_events_url
    else
      flash[:error] = "Event gagal dihapus"
      redirect_to admin_events_url
    end
  end

  protected
  def set_active_page
    session[:current_page] = "events"
  end

  def event_params
    params.require(:event).permit(:event_picture, :event_name, :event_short_desc, :event_desc, 
      :is_share, :event_pic, :event_pic_phone, :event_date)
  end
end
