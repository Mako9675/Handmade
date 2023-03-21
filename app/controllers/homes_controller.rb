class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @post_like_ranks = Post.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
    @post_comment_ranks = Post.includes(:comments).sort {|a,b| b.comments.size <=> a.comments.size}
  end

  def about
    @genres = Genre.all
  end
  
end
