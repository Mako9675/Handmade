class GenresController < ApplicationController
  def index
    @genres = Genre.all.page(params[:page]).per(10)
    @genre = Genre.find(params[:id])
  end
  
   private
  def genre_params
    params.require(:genre).permit(:genre_id)
  end
end
