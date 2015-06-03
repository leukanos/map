require 'rails_helper'

RSpec.describe PathHelperHelper, type: :helper do

  describe '#link_to_*' do
    let(:user) { create(:user) }

    describe '#link_to_edit' do
      it 'generates correct link' do
        link = link_to_edit edit_user_path(user)

        expect(link).to include('<span class="glyphicon glyphicon-edit">')
        expect(link).to have_css('a')
      end
    end

    describe '#link_to_destroy' do
      it 'generates correct link' do
        link = link_to_destroy user

        expect(link).to include('<span class="glyphicon glyphicon-remove">')
        expect(link).to have_css('a')

        expect(link).to include(t('confirm'))
        expect(link).to include('class="destroy"')
      end
    end
  end

  describe '#nav_link' do
    pending 'Add nav_link spec'
  end
end
