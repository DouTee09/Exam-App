class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  def logged_in
    unless user_signed_in?
      flash[:danger] = "Please login !!!"
      redirect_to root_path
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
