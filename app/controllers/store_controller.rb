class StoreController < ApplicationController
  include CurrentCart

  skip_before_action :authorize
  before_action :set_cart
  before_action :count_presence, only: %i[ index ]

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    end

    if I18n.locale.to_s == 'en'
      @products = Product.where(locale: 'english')
    elsif I18n.locale.to_s == 'es'
      @products = Product.where(locale: 'espanol')
    else
      @products = Product.order(:title)
    end
  end

  private

  def count_presence
     cookies[:counter] = cookies[:counter].to_i + 1
  end
end
