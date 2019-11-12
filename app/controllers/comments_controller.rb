class CommentsController < ApplicationController
  def new
    @posts = Post.includes(:user)
    @post =  Post.find(params[:post_id])
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to post_path(id: params[:post_id])
  end

  def edit
  end

  def update
  end


private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id]);
  end
end