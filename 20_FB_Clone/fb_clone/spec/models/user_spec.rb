require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "model init" do
    context "Validations" do
      it "should validates presence of a name" do
        should validate_presence_of :name
      end
      
      it "should validates presence of a last_name" do
        should validate_presence_of :last_name
      end
    end
  end
  
  describe "public methods" do
    context "Associations" do
      before(:example) do
        @user = create(:user)
        @another_user = create(:another_user)
      end
      
      it "can send a friend request" do
        @another_user.request_friendship(@user)
        expect(@user.received_friendships.count).to be == 1
      end
      
      it "accept friend request" do
        @another_user.request_friendship(@user)
        @user.accept_friend_request(@another_user)
        expect(@user.get_all_friends.count).to be == 1
      end
      
      it "check friend ships" do
        @another_user.request_friendship(@user)
        @user.accept_friend_request(@another_user)
        expect(@user.has_friendship?(@another_user)).to be true
      end
      
      it "reject friend request" do
        @another_user.request_friendship(@user)
        @user.reject_friend_request(@another_user)
        expect(@user.received_friendships.count).to be == 0
      end
      
      it "delete friendship" do
        @another_user.request_friendship(@user)
        @user.accept_friend_request(@another_user)
        expect(@user.get_all_friends.count).to be == 1
        @user.delete_friendship(@another_user)
        expect(@user.has_friendship?(@another_user)).to be false
      end
      
      it "cant send request to a friend" do
        @another_user.request_friendship(@user)
        @user.accept_friend_request(@another_user)
        expect(@another_user.request_friendship(@user)).to be nil
      end
    end
    
  end
end
