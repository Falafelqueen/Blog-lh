class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now logged in"
      log_in(@user)
      redirect_to articles_path
   else
    render :new
   end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end
end
