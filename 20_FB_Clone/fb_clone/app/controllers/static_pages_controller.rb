class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @feed = current_user.feed
    @post = current_user.posts.build
  end
end
