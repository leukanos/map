require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PathHelperHelper. For example:
#
# describe PathHelperHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PathHelperHelper, type: :helper do
  let(:user) { create(:user) }

  describe '#link_to_edit' do
    it 'generate_correct_link' do
      link = link_to_edit edit_user_path(user)
      binding.pry

      puts user
      puts link
      expect(link).to include('<span class="glyphicon glyphicon-edit">')
    end
  end
end
