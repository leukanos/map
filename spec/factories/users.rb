# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  tel                    :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  roles_mask             :integer
#  limit                  :decimal(8, 2)
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@test.com"}
    sequence(:first_name) { |n| "name_#{n}"}
    sequence(:last_name) { |n| "lastname_#{n}"}
    password 'asdf1234^'

    factory :admin do
      roles :admin
    end
  end

end
