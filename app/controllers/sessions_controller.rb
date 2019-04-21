class SessionsController < ApplicationController
	def new
                if session[:current_user_id]
                   redirect_to root_path
                end
	end

	def create
		#complete this method
                @user = User.where(log_params).first
                before_action :require_session_start

	end

	def destroy
		#complete this method
                flash[:notice] = 'Successfully logged out'
                session.delete(:current_user_id)
                redirect_to root_path
	end

   private
      def log_params
         params.require( :email, :password)
      end
      def require_session_start
         if @user
            session[:current_user_id]=@user.id
            flash[:notice] = 'You successfully logged in'
            redirect_to root_path
         else
            flash[:error] = 'User not found, please log in again'
            redirect_to '/login'
         end
      end
end
