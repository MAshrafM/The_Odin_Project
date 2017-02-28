require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Controller methods" do
    before(:example) do
      @user = create(:user)
      sign_in @user
    end
    
    context "Create post" do
      subject {post :create, post: {body: "Hello from Test"}}
      
      it "redirect to post path" do
        expect(subject).to redirect_to :root
      end
      
      subject {post :create, post: {body: ""}}
      
      it "redirect to post path" do
        expect(subject).to redirect_to :root
      end
      
    end
  end
end