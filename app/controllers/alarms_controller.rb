class AlarmsController < ApplicationController


  def create
    return render_error 'Username can\'t be empty!' unless params[:username].present?
    return render_error 'Message param can\'t be empty!' unless params[:message].present?
    #validate params
    username = params[:username]
    message = params[:message]
    
    Alarm.create(username:username, message:message)
    
    redirect_to action: :index
    
  end
  
  def index
    
    #paginate?
    @alarms = Alarm.order(created_at: :asc).reverse
    
  end

end