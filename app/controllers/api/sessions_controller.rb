class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(
            params[:user][:name],
            params[:user][:password]
        )
        puts params[:user][:name]
        puts params[:user][:password]
        puts @user
        if @user 
            login!(@user)
            render @current_user
        else 
            render json: ["Invalid email/password combination"], status: 401
        end
    end

    def destroy
        user = current_user
        if user
            logout!
            render json["logged out"]
        else
            render json: ["Nobody signed in"], status: 404
        end
    end
end
