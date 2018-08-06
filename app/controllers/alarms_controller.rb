class AlarmsController < ApplicationController


  def create
    return render_error 'Username can\'t be empty!' unless params[:username].present?
    return render_error 'Message param can\'t be empty!' unless params[:message].present?
    #validate params
    
    username = params[:username]
    message = params[:message]
    
    alarm = Alarm.create(username:username, message:message)
    flash[:error] = alarm.errors if alarm.errors.present?
    
    redirect_to action: :index
    
  end
  
  def index
    
    #paginate?
    @alarms = Alarm.order(created_at: :asc).reverse
    
    @alarms = Alarm.all.sort{ |a1,a2| a2.weight <=> a1.weight }
    
  end

end