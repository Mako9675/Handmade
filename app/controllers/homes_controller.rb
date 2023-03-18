class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @post_like_ranks = Post.where(id: Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def about
    @genres = Genre.all
  end
  
end
