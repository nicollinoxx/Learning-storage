class AdminController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @total_orders = Order.count
  end
end
