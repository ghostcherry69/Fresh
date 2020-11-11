class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.with_deleted
  end

  def show
    @user = User.with_deleted.find(params[:id])
  end

  def edit
    @user = User.with_deleted.find(params[:id])
  end

  def update
    @user = User.with_deleted.find(params[:id])
    if @user.update!(user_params)
      flash[:notice] = '会員情報の変更内容が保存されました'
      redirect_to  admin_user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
      params.require(:user).permit(:surname, :name, :surname_phonetic, :name_phonetic, :email, :password, :postal_code, :street_address, :phone_number, :is_active)
  end

end
