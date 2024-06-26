class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    
    private
    
    def authenticate_user
        render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
    end
end
