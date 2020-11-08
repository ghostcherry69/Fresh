class Seller::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @product = Product.limit(5)
    @products = Product.all
  end

end
