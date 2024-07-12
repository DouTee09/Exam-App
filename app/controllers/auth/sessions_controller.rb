# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  # prepend_before_action :require_no_authentication, only: [:new, :create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if user_signed_in?
      flash[:success] = "Wellcome signed Exam App"
      redirect_to home_path
    else
      super
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.delete(:notice)
    flash[:danger] = "You have been signed out"
  end

  protected

  def after_sign_in_path_for(resource)
    home_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
