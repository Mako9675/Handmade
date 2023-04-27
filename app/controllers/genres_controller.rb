class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.published.find(params[:id]).page(params[:page])
  end
  
   private
  def genre_params
    params.require(:genre).permit(:genre_id)
  end
end
