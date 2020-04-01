class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if pass_match == true
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to home_path
        else
            binding.pry
            redirect_to new_user_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    def pass_match
        params[:user][:password] == params[:user][:password_confirmation]
    end
end
