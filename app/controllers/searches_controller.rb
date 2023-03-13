class SearchesController < ApplicationController
  def search
    
    @genre = Genre.all
    
    @posts = Postgit .search(params[:keyword])
  end
end
