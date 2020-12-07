class EventsController < ApplicationController
  before_filter :authorize

  def index
    @events = Event.all.order('created_at DESC')
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(post_params)

    if @event.save
      flash.notice = 'Event created!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def post_params
    params.require(:event).permit(:location, :description, :title, :date)
  end
end
