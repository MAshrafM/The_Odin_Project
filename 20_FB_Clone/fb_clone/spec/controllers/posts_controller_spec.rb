require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Controller methods" do
    before(:example) do
      @user = create(:user)
      sign_in @user
      @user.posts.create(body: "Hello World")
      @user.posts.create(body: "Hello Odin")
    end
    
    context "Create post" do
      subject {post :create, post: {body: "Hello from Test"}, format: :js}
      
      it "redirect to Home" do
        expect(subject.status).to eq(200)
        expect{ post :create, post: { body: "Hello from Test" }, format: :js }.to change(Post, :count).by(+1)
      end
      
      subject {post :create, post: {body: ""}, format: :js}
      
      it "redirect to Home" do
        expect(subject.status).to eq(200)
        expect{  post :create, post: { body: "" }, format: :js }.to change(Post, :count).by(0)
      end
    end
    
    context "Destroy posts" do
      subject { delete :destroy , id: @user.posts.last }
      it "redirects home after destroy" do
        expect(subject).to redirect_to :root
        expect{ delete :destroy, :id => @user.posts.last }.to change(Post, :count).by(-1)
      end
    end
  end
end