class Admin::AnglersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @anglers = Angler.with_deleted
  end

  def show
    @angler = Angler.with_deleted.find(params[:id])
  end

  def edit
    @angler = Angler.with_deleted.find(params[:id])
  end

  def update
    @angler = Angler.with_deleted.find(params[:id])
    if @angler.update!(angler_params)
      flash[:notice] = '会員情報の変更内容が保存されました'
      redirect_to  admin_angler_path(@angler.id)
    else
      render :edit
    end
  end

  private
  def angler_params
      params.require(:angler).permit(:surname, :name, :surname_phonetic, :name_phonetic, :email, :password, :postal_code, :street_address, :phone_number, :is_active)
  end

end
