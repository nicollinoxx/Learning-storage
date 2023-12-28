class ApplicationController < ActionController::Base
  before_action :authorize

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
end
