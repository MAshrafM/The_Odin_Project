class StaticPagesController < ApplicationController
  def index
    @user = params[:user_id] || Figaro.env.flickr_id
  end
end
