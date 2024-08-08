class ApplicationController < ActionController::Base
  # def set_locale
  #   locale = params[:locale].to_s.strip.to_sym
  #   I18n.locale = I18n.available_locales.include?(locale) ?
  #     locale : I18n.default_locale
  # end

  private def logged_in
    unless user_signed_in?
      flash[:danger] = "Please login !!!"
      redirect_to root_path
    end
  end
end
