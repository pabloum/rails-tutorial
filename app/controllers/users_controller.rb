class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'users/new'
    end
  end



  def user_params
    params.require(:user).permit(:name)
  end
end
