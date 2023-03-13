class SearchesController < ApplicationController
  def search
    
    @genre = Genre.all
    
    @posts = Post.search(params[:keyword])
  end
end
