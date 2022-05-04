class CommentsController < ApplicationController
  
  def create
    set_post
    comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    set_post
    comment = @post.comments.find(params[:id])
    comment.destroy
    redirect_to post_path(@post), status: 303
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
