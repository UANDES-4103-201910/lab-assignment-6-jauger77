class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	if session[:current_user_id]
           User.find_by(id: session[:current_user_id]
        end
     
  end

  def is_user_logged_in?

  	logged_in = false
        if session[:current_user_id]
           logged_in = true
        end
	if logged_in then true else redirect_to root_path end 

  end
end
