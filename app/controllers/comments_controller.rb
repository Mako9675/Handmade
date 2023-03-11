class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      render :comment
    else
      render 'posts/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    flash[:notice] = '投稿を削除しました'
    @post = Post.find(params[:post_id])  
    render :comment
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
