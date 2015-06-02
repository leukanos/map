FactoryGirl.define do
  factory :kind do
    sequence(:name) { |n| "kind_#{n}"}
  end
end
