class EventsController < ApplicationController
  before_action :authorize, except: %i[index show]

  def index
    @past = Event.past.order('date DESC')
    @upcoming = Event.upcoming.order('date DESC')
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash.notice = 'Event created!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendances = Attendance.where('status = ?', true).where('concerned_event_id = ?', @event.id)
  end

  private

  def event_params
    params.require(:event).permit(:location, :description, :title, :date, :creator_id)
  end
end
