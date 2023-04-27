class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @posts = Post.where(genre_id: params[:id]).published.page(params[:page])
  end
  
   private
  def genre_params
    params.require(:genre).permit(:genre_id)
  end
end
