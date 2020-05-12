class Admin::GenresController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, success: "ジャンルの新規登録が完了しました。"
    else
      @genres = Genre.all
      render action: :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, success: "ジャンルの編集が完了しました。"
    else
      render action: :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :validation)
  end

end

