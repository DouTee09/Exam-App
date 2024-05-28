class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "User not found."
      redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Exam App"
      redirect_to root_path
    else
      render 'new'
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
