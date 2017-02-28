require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "Controller methods" do
    before(:example) do
      @user = create(:user)
      sign_in @user
    end
    
    context "get home" do
      
      it "render home" do
        get :home
        expect(response).to render_template(:home)
      end
           
    end
  end
end
