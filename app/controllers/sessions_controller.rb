class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
    end

    def create        
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_profile_path
        else
            flash[:alert] = "Incorrect Email or Password"            
            redirect_to session_new_path
        end
    end
 
    def destroy
        session.delete(:user_id)
        flash[:notice] = "Logged out successfully."
        redirect_to root_path
    end
end
