class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @new_genre = Genre.new
    @genres = Genre.all
  end

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:notice] ='ジャンルが保存されました'
      redirect_to  admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'ジャンルの変更内容が保存されました'
      redirect_to  admin_genres_path
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_active, :parent_id)
  end

end
