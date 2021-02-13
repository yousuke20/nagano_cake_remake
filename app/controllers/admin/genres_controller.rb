class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

# 新規登録ジャンルデータの保存
  def create
    @genre = Genre.new(genre_params)
    @genre.id = Item.genre_id
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  # ジャンルデータのストロングパラメータ
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
