class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(signup_params)
    if user.save 
      session[:user_id] = user.id 
    else
      redirect_to users_new_path
    end
  end

  private 
  def signup_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end
end
