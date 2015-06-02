require 'rails_helper'

RSpec.describe Kind, type: :model do
  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}
  it { should have_many :work_times }

  it 'should validate case insensitive uniqueness' do
    create(:kind, name: 'category')
    expect(build(:kind, name: 'category')).not_to be_valid
  end
end
