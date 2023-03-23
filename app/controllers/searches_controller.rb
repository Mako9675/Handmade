class SearchesController < ApplicationController
  def search
    
    @genres = Genre.all
    
    @posts = Post.page(params[:page]).per(10).search(params[:keyword])
  end
end
