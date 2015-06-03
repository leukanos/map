FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@test.com"}
    sequence(:firstname) { |n| "name_#{n}"}
    sequence(:lastname) { |n| "lastname_#{n}"}
    password 'asdf1234^'
  end

end
