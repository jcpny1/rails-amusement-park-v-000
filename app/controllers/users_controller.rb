class UsersController < ApplicationController

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def signin
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(name: user_params[:name])
    @user.update(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end
end
