class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user 
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to welcome_path
            else
                flash[:alert] = "Incorrect Password"
                redirect_to login_path
            end
        else
            flash[:alert] = "Could not find user"
            redirect_to login_path
        end
    end
end