class StoreController < ApplicationController
before_action :count_presence, only: %i[ index ]

  def index
    @products = Product.order(:title)
  end

  private

  def count_presence
     cookies[:counter] = cookies[:counter].to_i + 1
  end
end
