FactoryGirl.define do
  factory :project do
    sequence(:short_name) { |n| "name_#{n}"}
    sequence(:name) { |n| "Full Name #{n}"}
  end

end
