class Angler::UsersController < ApplicationController

  before_action :authenticate_angler!

  def index
    @users = User.with_deleted
  end

  def show
    @user = User.with_deleted.find(params[:id])
  end

  private
  def user_params
      params.require(:user).permit(:surname, :name, :surname_phonetic, :name_phonetic, :email, :password, :postal_code, :street_address, :phone_number, :is_active)
  end

end
