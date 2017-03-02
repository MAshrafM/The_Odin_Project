class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:other_user_id])
    if current_user.request_friendship(@user)
      respond_to do |format|
        format.html {redirect_to @user }
        format.js {}
      end
    end
  end
  
  def update
    @user = User.find(params[:other_user_id])
    if current_user.get_relationship(@user).update_attributes(friends: true)
      respond_to do |format|
        format.html {redirect_to @user }
        format.js {}
      end
    end
  end
  
  def destroy
    @user = User.find(params[:other_user_id])
    @relationship = Friendship.find(params[:id])
    if @relationship.destroy
      respond_to do |format|
        format.html {redirect_to @user }
        format.js {}
      end
    end
  end
end
