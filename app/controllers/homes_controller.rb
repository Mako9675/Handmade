class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @post_like_ranks = Post.includes(:favorites).published.limit(5).sort {|a,b| b.favorites.size <=> a.favorites.size}
    @post_comment_ranks = Post.includes(:comments).published.limit(5).sort {|a,b| b.comments.size <=> a.comments.size}
  end

  def about
    @genres = Genre.all
  end
  
end
