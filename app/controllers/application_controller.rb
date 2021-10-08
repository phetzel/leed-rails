class ApplicationController < ActionController::API
    # protect_from_forgery with: :exceptions
    # helper_method :current_user, :logged_in?

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
