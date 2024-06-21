class UsersController < ApplicationController
  before_action :logged_in, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "User not found."
    redirect_to home_path
  end

  def create
    @user = User.new(user_params)
    @user.failed_attempts = 0
    @user.role = 0
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Exam App"
      redirect_to home_path
    else
      flash.now[:danger] = "Please enter correct information"
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
