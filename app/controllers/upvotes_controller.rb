class UpvotesController < ApplicationController
  
  def create
    positive = (params[:positive].present? && params[:positive] == 'true')
    
    alarm = Alarm.find(params[:alarm_id])
    Upvote.create(alarm:alarm, positive:positive)
    
    redirect_to controller: :alarms, action: :index
  end
  
end