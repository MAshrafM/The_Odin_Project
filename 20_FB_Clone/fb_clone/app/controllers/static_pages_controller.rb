class StaticPagesController < ApplicationController
  def home
    @feed = current_user.feed
    @post = current_user.posts.build
  end
end
