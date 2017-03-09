class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(body: params[:comment][:body], post_id: @post.id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_url }
        format.js
      end
    end
  end
  
  def update
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to root_url }
        format.js
      end
    end
  end
end
