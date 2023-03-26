class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @post_like_ranks = Post.joins(:favorites).published.sort {|a,b| b.favorites.size <=> a.favorites.size}.uniq.limit(5)
    @post_comment_ranks = Post.joins(:comments).published.sort {|a,b| b.comments.size <=> a.comments.size}.uniq.limit(5)
  end

  def about
    @genres = Genre.all
  end
  
end
