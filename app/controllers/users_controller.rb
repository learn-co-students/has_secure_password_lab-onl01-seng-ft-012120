class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      flash[:success] = "User successfully created"
      session[:user_id] = @user.id
      redirect_to new_user_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_user_path
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :password, :confirm_password)
  end
  
end
