class UsersController < ApplicationController
    def new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            User.create(user_params)
            session[:user_id] = User.last.id
            redirect_to welcome_path
        else
            redirect_to signup_path
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end
end