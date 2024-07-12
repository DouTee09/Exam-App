# frozen_string_literal: true

class Auth::PasswordsController < Devise::PasswordsController
  before_action :require_no_authentication, :only => [:edit, :update]
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  protected

  def after_resetting_password_path_for(resource)
    home_path
  end
end
