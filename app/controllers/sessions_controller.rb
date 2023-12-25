class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action :create_admin_if_admin_nil, only: %i[ create ]

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end

  private

  private

  def create_admin_if_admin_nil
    if User.count.zero?
      User.create(name: params[:name], password: params[:password], password_confirmation: params[:password])
    end
  end
end
