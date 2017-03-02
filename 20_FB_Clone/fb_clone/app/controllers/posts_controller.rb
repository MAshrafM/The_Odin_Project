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
      respond_to do |format|
        format.html{ redirect_to root_url }
        format.json { render 'static_pages/home', status: :created }
        format.js {}
      end
      flash[:success] = "Your post has been posted successfully"
    else
      respond_to do |format|
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js {}
      end
      flash[:error] = "Something went wrong"
    end
    redirect_to root_url
  end
  
  def destroy
    @post= Post.find(parmas[:id])
    if @post.destroy
      respond_to |format| do
        format.html {redirect_to root_url}
        format.js {}
      end
      
    end
  end
  private
  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
