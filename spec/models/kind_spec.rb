# == Schema Information
#
# Table name: kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Kind, type: :model do
  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}
  it { should have_many :work_times }
  it { should have_many :projects }

  it 'should validate case insensitive uniqueness' do
    create(:kind, name: 'category')
    expect(build(:kind, name: 'category')).not_to be_valid
  end

  describe 'with correct kind' do
    let(:kind) { create(:kind) }

    it '#to_s' do
      expect(kind.to_s).to eq(kind.name.humanize)
    end

    it '#color' do
      expect(kind.color).to eq(kind.name.pastel_color)
    end
  end
end
