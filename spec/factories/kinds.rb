# == Schema Information
#
# Table name: kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :kind do
    sequence(:name) { |n| "kind_#{n}"}
  end

  factory :invalid_kind, class: Kind do
    name ''
  end
end
