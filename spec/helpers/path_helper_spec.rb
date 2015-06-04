require 'rails_helper'

RSpec.describe PathHelper, type: :helper do

  describe '#link_to_*' do
    let(:user) { create(:user) }

    describe '#link_to_edit' do
      it 'generates correct link' do
        link = link_to_edit edit_user_path(user)

        expect(link).to have_selector('span.glyphicon.glyphicon-edit')
        expect(link).to have_selector('a')
      end
    end

    describe '#link_to_destroy' do
      it 'generates correct link' do
        link = link_to_destroy user

        expect(link).to have_selector('span.glyphicon.glyphicon-remove')
        expect(link).to have_selector('a')

        expect(link).to have_selector('.destroy')
        expect(link).to include(t('confirm'))
      end
    end
  end

  describe '#nav_link' do
    before :each do
      controller.stub(:params).and_return({controller: 'work_times'})
    end

    it 'return link with correct selected class' do
      link = nav_link(t('shared.work_times'), work_times_path)
      expect(link).to have_selector("a.btn.btn-success[href='#{work_times_path}']",
                        text: t('shared.work_times'))
    end

    it 'return correct link withoud selected class' do
      link = nav_link(t('shared.users'), users_path)
      expect(link).to have_selector("a.btn[href='#{users_path}']",
                        text: t('shared.users'))
      expect(link).not_to have_selector('.btn-success')
    end
  end
end
