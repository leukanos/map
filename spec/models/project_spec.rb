require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should belong_to :assigned_to }
  it { should have_and_belong_to_many :users }
  it { should have_many :work_times}
  it { should have_many :kinds}

  it { should validate_presence_of :name}
  it { should validate_presence_of :short_name}
  it { should validate_uniqueness_of :short_name}

  describe 'with valid project' do
    let(:project) { create(:project) }

    it '#to_s' do
      expect(project.to_s).to eq(project.short_name.humanize)
    end

    it '#color' do
      expect(project.color).to eq(project.name.pastel_color)
    end
  end
end
