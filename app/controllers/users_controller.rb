class UsersController < ApplicationController
  before_action :logged_in, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "User not found."
    redirect_to home_path
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_update_params)
      flash[:success] = "Updated user successfully"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Can't update user: #{@user.errors.full_messages.join(', ')}"
      redirect_to user_path(current_user)
    end
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

  def index
    @users = User.page(params[:page]).per(5)
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:success] = "User successfully destroyed"
      redirect_to users_path
    else
      flash[:danger] = "Error while destroying"
      redirect_to users_path
    end
  end

  def deactivate
    user = User.find(params[:user_id])
    if current_user.role == 1
      user.deactivate_account!
      flash[:success] = "User account deactivated."
    else
      flash[:danger] = "You are not authorized to perform this action."
    end
    redirect_to users_path
  end

  def activate
    user = User.find(params[:user_id])
    if current_user.role == 1
      user.activate_account!
      flash[:success] = "User account activated."
    else
      flash[:danger] = "You are not authorized to perform this action."
    end
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_update_params
      params.require(:user).permit(:name, :email)
    end
end
