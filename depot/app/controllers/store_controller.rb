class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@now = Time.current.in_time_zone("America/Sao_Paulo").strftime("%d/%m/%Y %H:%M:%S")
  end
end
