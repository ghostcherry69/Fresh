class Public::HomesController < ApplicationController

   def top
      @genres = Genre.all
      @products = Product.all
  end

end
