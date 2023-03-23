class SearchesController < ApplicationController
  def search
    
    @genres = Genre.all
    
    @posts = Post.page(params[:page]).search(params[:keyword])
  end
end
