class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).per(8)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    flash[:notice] = "ジャンルを編集しました"
    redirect_to admin_genres_path
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
