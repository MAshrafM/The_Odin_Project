class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @feed = current_user.feed.paginate(page: params[:page], per_page: 30)
    @post = current_user.posts.build
  end
end
