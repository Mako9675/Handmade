class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @post_like_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end

  def about
    @genres = Genre.all
  end
  
end
