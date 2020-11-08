class Seller::OrdersController < ApplicationController

  before_action :authenticate_angler!

  def index
    @orders = Order.all.order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
    @ordered_products = @order.ordered_products
      @ordered_products.each do |ordered_product|
      @total_price += ordered_product.purchase_price * ordered_product.quantity
      end
  end

  def update
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
    @order.order_status == "1" || @order.order_status == "3"
    @order.update(order_params)
    flash[:notice] = '注文ステータスが変更されました'
    redirect_to  admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :street_address, :name, :postage, :request_amount, :method_payment, :order_status)
  end

end
