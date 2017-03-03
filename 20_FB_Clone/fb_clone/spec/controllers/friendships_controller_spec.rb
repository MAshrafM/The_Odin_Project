require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) {create(:user)}
  let(:another_user) {create(:another_user)}
  
  before(:example) do
    sign_in user
  end
  
  describe "create" do
    context 'when a user requests a friendship' do
      subject { post :create, { other_user_id: another_user.id } }
      it 'redirects to the users show page' do
        expect(subject).to redirect_to another_user
      end
    end
  end
  
  before :example do
    another_user.request_friendship(user)
  end
  
  describe "update" do
    context 'when a user accepts a friendship' do
      subject { patch :update, { id: user.id, other_user_id: another_user.id } }
      it 'redirects to the users show page' do
        expect(subject).to redirect_to another_user
      end
    end
  end
  
  describe "#destroy" do
    context 'when a user rejects a request or deletes a friend' do
      subject { delete :destroy, { id: user.get_relationship(another_user).id, other_user_id: another_user.id } }
      it 'redirects to the rejected or deleted user' do
        expect(subject).to redirect_to another_user
      end
    end
  end
  
end
