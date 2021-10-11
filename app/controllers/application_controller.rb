class ApplicationController < ActionController::API
    skip_before_action :verify_authenticity_token, raise: false
    include ActionController::Helpers


    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def require_user!
        unless current_user
            render json: { base: ['Invalid Credentials'] }, status: 401
        end 
    end

    def logged_in?
        !!current_user
    end 

    def login!(user)
        user.reset_session_token!
        session[:session_token] = user.session_token
        @current_user = user
    end
    
    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
end
