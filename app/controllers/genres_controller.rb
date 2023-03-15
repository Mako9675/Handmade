class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
