require 'rails_helper'

RSpec.describe KindsController, type: :controller do
  let(:user) { create(:user) }


  describe "GET #index" do
    context 'when user is logged in' do
      before do
        sign_in user
        get :index
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }
    end
  end

  describe "GET #create" do
    context 'when user is logged in' do
      before do
        sign_in user
        get :index
      end

      it { should permit(:name).for(:create)}
    end
  end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
