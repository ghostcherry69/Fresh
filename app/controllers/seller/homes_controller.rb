class Seller::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @products = Product.all.page(params[:page]).reverse_order
  end

end
