class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:intro]
  
  def home
    @feed = current_user.feed.paginate(page: params[:page], per_page: 30)
    @post = current_user.posts.build
  end
  
  def intro
  
  end
end
