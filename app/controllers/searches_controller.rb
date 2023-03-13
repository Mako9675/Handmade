class SearchesController < ApplicationController
  def search
    
    @genres = Genre.all
    
    @posts = Post.search(params[:keyword])
  end
end
