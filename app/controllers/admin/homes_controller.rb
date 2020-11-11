class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @product = Product.limit(5)
    @orders = Order.count
  end

end
