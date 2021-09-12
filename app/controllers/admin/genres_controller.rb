class Admin::GenresController < ApplicationController
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'ジャンルが保存されました'
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      flash.now[:notice] = '保存せれていません'
      render 'index'
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
    
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'update'
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
private
    def genre_params
      params.require(:genre).permit(:name)
    end

end
