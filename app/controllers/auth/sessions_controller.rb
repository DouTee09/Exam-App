# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  layout false
  # skip_before_action :logged_in
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    redirect_to home_path if logged_in?
  end

  # POST /resource/sign_in
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

  # DELETE /resource/sign_out
  def destroy
    log_out
    redirect_to root_path
  end


  protected

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end

  private
    def reset_failed_attempts(user)
      user.update(failed_attempts: 0)
    end
end
