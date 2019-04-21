class RegistrationsController < ApplicationController
	def new
	
	end

	def create
           @user=User.create!(create_params)
           puts @user.inspect
           before_action :require_loggin
	   
	end

   private

      def create_params
         params.require( :name, :last_name, :email, :password, :phone)
      end

      def require_loggin
         if @user.save
            flash[:error] = "User created successfully"
            redirect_to '/login'
         else 
            flash[:notice] = "User creation failed"
            redirect_to '/sign_in'
      end

         

end
