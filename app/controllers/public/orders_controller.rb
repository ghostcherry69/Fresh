class Public::OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_all = @order.ordered_products
  end

  def new
    @new_order = Order.new
    @delivery_destination = current_user.delivery_destinations
    @new_genre = Genre.new
  end

  def confirm
    @product_in_carts = current_user.product_in_carts
    @total_price = 0
    @product_in_carts.each do |product_in_cart|
      item_price = (product_in_cart.product.price_excluding_tax * 1.1).round
      @total_price += item_price * product_in_cart.quantity
    end

    @address_option = params[:order][:address_option]
    @new_order = Order.new(order_params)
    if @address_option == "0"
      @new_order.postal_code = current_user.postal_code
      @new_order.street_address = current_user.street_address
      @new_order.name = current_user.full_users_name
    elsif @address_option == "1"
      @delivery = DeliveryDestination.find(params[:order][:delivery_id])
      @new_order.postal_code = @delivery.postal_code
      @new_order.street_address = @delivery.street_address
      @new_order.name = @delivery.name
    else
      if @new_order.postal_code == "" || @new_order.street_address == "" || @new_order.name == ""
        @delivery_destination = current_user.delivery_destinations
        @new_genre = Genre.new
        flash[:notice] = "入力されていない情報があります"
      else
        @new_order.postal_code = params[:order][:postal_code]
        @new_order.street_address = params[:order][:street_address]
        @new_order.name = params[:order][:name]
      end
    end
  end

  def create
    @new_order = Order.new(order_params)
    @new_order.user_id = current_user.id
    @address_option = params[:order][:address_option]
    if request.referer.split('/')[-1] == 'confirm'
      @new_order.save
      if @address_option == "2"
        delivery_destination = DeliveryDestination.new(postal_code: params[:order][:postal_code],
                                                       street_address: params[:order][:street_address],
                                                       name: params[:order][:name],
                                                       user_id: current_user.id)
        delivery_destination.save
      end
      @product_in_carts = current_user.product_in_carts
       @product_in_carts.each do |product_in_cart|
       @ordered_product = OrderedProduct.new
       @ordered_product.order_id = @new_order.id
       @ordered_product.product_id = product_in_cart.product.id
       @ordered_product.quantity = product_in_cart.quantity
       @ordered_product.purchase_price = (product_in_cart.product.price_excluding_tax * 1.1).round
       @ordered_product.save
         @product = product_in_cart.product
         if @product.quantity - product_in_cart.quantity == 0
            @product.update(is_active: false)
         else
            @product.update_attribute(:quantity, @product.quantity - product_in_cart.quantity)
         end
       end
      @product_in_carts.destroy_all
      redirect_to user_thanks_path
    else
      flash[:notice] = "予期せぬエラーが発生しました"
      redirect_to user_product_in_carts_path
    end
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :street_address, :name, :postage, :request_amount, :method_payment, :order_status)
  end

end
