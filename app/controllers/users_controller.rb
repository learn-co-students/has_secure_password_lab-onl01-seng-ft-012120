class UsersController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    user = User.new(signup_params)
    if user.save 
      session[:user_id] = user.id
       redirect_to home_path
    else
      redirect_to signup_path
    end
  end

  def home 
    @user = User.find(session[:user_id])
  end

  private 
  def signup_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end
end
