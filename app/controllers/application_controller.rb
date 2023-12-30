class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_i18n_locale_from_params

  protected

  def authorize
    if User.count.zero?
      session[:user_id] #id value is in (sessions_controller)
    else
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
  end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end
