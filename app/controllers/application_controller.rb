class ApplicationController < ActionController::Base
  private def logged_in
    unless user_signed_in?
      flash[:danger] = "Please login !!!"
      redirect_to root_path
    end
  end
end
