FactoryGirl.define do
  factory :work_time do
    user
    kind
    project
    date Date.today
    sequence(:time) { rand(8).to_i }
  end
end
