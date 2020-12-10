class UsersController < ApplicationController
  before_action :authorize, only: [:attend_events]

  def index
    @users = User.where("id != ?", current_user.id).order('username ASC')
    @event = Event.find(params[:event_id])
  end

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

  def attend_events
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @attendance = @user.attendances.where("concerned_event_id = ?", @event.id).first.status = true
    @attendance.save
    flash.notice = 'Invitation Accepted!'
    redirect_to "/"
  end

  def withdraw_events
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @user.concerned_events.delete(@event)
    flash.notice = 'Event Cancelled!'
    redirect_to "/"
  end

  def inviteUser
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @user.attendances.create(concerned_event: @event)
    flash.notice = "Invitation sent to #{@user.username} !"
    redirect_to "/inviteUsers/#{@event.id}"
  end

  def cancelInviteUser
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @user.concerned_events.delete(@event)
    flash.notice = "Invitation cancelled for #{@user.username} !"
    redirect_to "/inviteUsers/#{@event.id}"
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
