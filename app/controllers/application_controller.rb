class ApplicationController < ActionController::Base
  
  def render_error error
    return render json: {success:false,error:error}
  end
  
end
