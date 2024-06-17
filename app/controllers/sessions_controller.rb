class SessionsController < ApplicationController
  MAX_LOGIN_ATTEMPTS = 5

  def new
    redirect_to home_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      if user.failed_attempts >= MAX_LOGIN_ATTEMPTS
        flash[:danger] = "Your account has been locked due to too many failed login attempts"
        render "new"
      else
        reset_failed_attempts(user)
        log_in user
        flash[:success] = "Welcome to the Exam App"
        redirect_to home_path
      end
    else
      if user
        user.increment!(:failed_attempts)
        if user.failed_attempts >= MAX_LOGIN_ATTEMPTS
          flash[:danger] = "Your account has been locked due to too many failed login attempts"
          render "new"
        else
          flash.now[:danger] = "Email or password incorrect"
          render "new"
        end
      else
        flash.now[:danger] = "Email or password incorrect"
        render "new"
      end
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private

  def reset_failed_attempts(user)
    user.update(failed_attempts: 0)
  end
end
