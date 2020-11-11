class Public::ProductInCartsController < ApplicationController

   before_action :authenticate_user!

  def index
    @product_in_carts = current_user.product_in_carts
    @total_price = 0
    @product_in_carts.each do |product_in_cart|
      item_price = (product_in_cart.product.price_excluding_tax * 1.1).round
      @total_price += item_price * product_in_cart.quantity
    end
  end

  def create
    if params[:product_in_cart][:quantity].to_i == 0
      redirect_to user_product_in_carts_path
    return
    end
    @new_product_in_cart = ProductInCart.new(product_in_cart_params)
    @new_product_in_cart.user_id = current_user.id
    if @new_product_in_cart.product.posted_by?(current_user)
      @product_in_cart = ProductInCart.find_by(user_id: current_user.id, product_id: @new_product_in_cart.product.id)
      @product_in_cart.update_attribute(:quantity, @product_in_cart.quantity + @new_product_in_cart.quantity)
      flash[:notice] ='商品が保存されました'
    else
      @new_product_in_cart.user_id = current_user.id
      @new_product_in_cart.save
      flash[:notice] ='商品が保存されました'
    end
    redirect_to public_product_in_carts_path
  end

  def update
    @product_in_cart = ProductInCart.find(params[:id])
    if params[:product_in_cart][:quantity].to_i == 0
      @product_in_cart.destroy
      flash[:notice] = "カート商品が削除されました"
      redirect_to user_product_in_carts_path
    else
      @product_in_cart.update(product_in_cart_params)
      flash[:notice] = "カート内商品数量が変更されました"
      redirect_to user_product_in_carts_path
    end
  end

  def destroy
    product_in_cart = ProductInCart.find(params[:id])
    product_in_cart.destroy
    flash[:notice] = "カート内商品が削除されました"
    redirect_to user_product_in_carts_path
  end

  def empty
    product_in_carts = ProductInCart.where(user_id: current_user.id)
    product_in_carts.destroy_all
    flash[:notice] = "カート内商品が全て削除されました"
    redirect_to user_product_in_carts_path
  end

  private
  def product_in_cart_params
      params.require(:product_in_cart).permit(:quantity, :product_id)
  end

end
