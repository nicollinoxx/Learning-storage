class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action :authenticate_user_if_users_nil, only: %i[ create ]

  def new
  end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
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

  def authenticate_user_if_users_nil
    if User.count.zero?
      @user = User.new(id: '1', name: params[:name], password: params[:password], password_confirmation: params[:password])
    else
      @user = User.find_by(name: params[:name])
    end
  end
end
