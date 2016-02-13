class StoreController < ApplicationController
  def index
	if session[:counter].nil?
		session[:counter] = 0
	end

	session[:counter] += 1

	@counter = session[:counter]
  	@products = Product.order(:title)
  	@now = Time.current.in_time_zone("America/Sao_Paulo").strftime("%d/%m/%Y %H:%M:%S")
  end
end
