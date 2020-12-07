class Angler::ProductsController < ApplicationController

  before_action :authenticate_angler!

  def new
    @new_product = Product.new
  end

  def create
    @new_product = Product.new(product_params)
    @new_product.angler_id = current_angler.id
    if @new_product.save
      flash[:notice] ='商品が保存されました。'
      redirect_to  angler_product_path(@new_product.id)
    else
      render :new
    end
  end

  def index
    @products = Product.all.page(params[:page])
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    flash[:notice] = '商品内容の変更が保存されました'
    redirect_to  angler_product_path(@product.id)
    else
    render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:notice] = "商品が削除されました"
    redirect_to angler_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :genre_id, :shop_id, :image, :explanation, :price_excluding_tax, :stock_quantity, :is_active)
  end

end
