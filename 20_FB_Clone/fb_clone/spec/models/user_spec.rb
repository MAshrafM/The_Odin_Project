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
        expect(@user.notifications.count).to be == 1
      end
      
      it "accept friend request" do
        @another_user.request_friendship(@user)
        @user.accept_friend_request(@another_user)
        expect(@user.get_all_friends.count).to be == 1
        expect(@user.notifications.count).to be == 1
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
    
    context "User feed" do
      before(:example) do
        @user 	= create(:user)
        @another_user = create(:another_user)
        @another_user.request_friendship(@user)
        @user.accept_friend_request(@another_user)
        2.times do |n|
          @another_user.posts.create(body: "Hello world this is the post number #{n}")
          @user.posts.create(body: "Hello world this is Admin with my post number #{n}")
        end
      end
      
      it 'gets the feed of friends' do
        @another_user.posts.each do |post|
          expect(@user.feed.include?(post)).to be true
        end
        
        @user.posts.each do |post|
          expect(@another_user.feed.include?(post)).to be true
        end
      end
      
      it 'gets the feed of self' do
        @another_user.posts.each do |post|
          expect(@another_user.feed.include?(post)).to be true
        end
        
        @user.posts.each do |post|
          expect(@user.feed.include?(post)).to be true
        end
      end
    end
  end

end
