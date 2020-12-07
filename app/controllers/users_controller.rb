class UsersController < ApplicationController
  before_action :authorize, only: [:attend_events]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def attend_event
    @event = Event.find(params[:id])
    current_user.attendances(concerned_event: @event)
    flash.notice = 'Event Attended!'
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

