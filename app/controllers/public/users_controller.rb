class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "変更内容が保存されました"
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  def confirm
    @user = current_user
  end

  def withdrow
    user = current_user
    user.destroy
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def user_params
      params.require(:user).permit(:surname, :name, :surname_phonetic, :name_phonetic, :email, :postal_code, :street_address, :phone_number, :is_active)
  end

end
