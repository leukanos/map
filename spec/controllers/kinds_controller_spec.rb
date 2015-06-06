require 'rails_helper'

RSpec.describe KindsController, type: :controller do
  let(:user) { create(:user) }

  describe 'when user is logged in' do
    describe "GET #index" do
      before do
        sign_in user
        get :index
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }

      # test strong parameters
      it { should permit(:name).for(:create)}
    end

    describe "GET #create" do
      before do
        sign_in user
      end

      it 'create kind and redirect with message' do
        expect{
          post :create, kind: FactoryGirl.attributes_for(:kind)
        }.to change{Kind.count}.by(1)

        expect(response).to redirect_to kinds_path
      end

      it "don't create with error" do
        expect{
          post :create, kind: FactoryGirl.attributes_for(:invalid_kind)
        }.to change{Kind.count}.by(0)

        expect(response).to render_template :index
      end
    end
  end

  describe 'when user is not logged in' do
    it 'redirect to new session paht'do
      get :index
      expect(response).to redirect_to new_user_session_path
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
