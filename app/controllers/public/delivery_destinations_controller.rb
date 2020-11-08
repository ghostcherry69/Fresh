class Public::DeliveryDestinationsController < ApplicationController

  before_action :authenticate_user!

  def new
    @new_delivery_destination = DeliveryDestination.new
    @delivery_destinations = current_user.delivery_destinations
  end

  def create
    @new_delivery_destination= DeliveryDestination.new(delivery_destination_params)
    @new_delivery_destination.user_id = current_user.id
    if @new_delivery_destination.save
       flash[:notice] ='配送先が登録されました'
       redirect_to new_user_delivery_destination_path
    else
       @delivery_destinations = DeliveryDestination.all
       render :new
    end
  end

  def edit
    @delivery_destination = DeliveryDestination.find(params[:id])
  end

  def update
    @delivery_destination = DeliveryDestination.find(params[:id])
    if @delivery_destination.update(delivery_destination_params)
       flash[:notice] = '配送先内容が保存されました'
       redirect_to  new_user_delivery_destination_path
    else
       render :edit
    end
  end

  def destroy
    delivery_destination = DeliveryDestination.find(params[:id])
    delivery_destination.destroy
    flash[:notice] = "配送先が削除されました"
    redirect_to new_user_delivery_destination_path
  end

  private
  def delivery_destination_params
    params.require(:delivery_destination).permit(:postal_code, :street_address, :name)
  end

end
