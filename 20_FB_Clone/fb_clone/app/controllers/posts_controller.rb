class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been posted successfully"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to root_url
  end
  
  def destroy
    @post= Post.find(parmas[:id])
    if @post.destroy
      redirect_to root_url
    end
  end
  private
  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
