class Public::ProductsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:genre_id]
       @products = Product.where(genre_id: params[:genre_id])
       @genre = Genre.find(params[:genre_id])
    else
       @products = Product.all
    end
  end

  def show
    @genres = Genre.all
    @product = Product.find(params[:id])
    @new_product_in_cart = ProductInCart.new
    @stock_quantity_array = []
    @stock_quantity_array = (1..@product.stock_quantity).to_a
  end

end
