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
#  firstname              :string(255)
#  lastname               :string(255)
#  roles_mask             :integer
#  limit                  :decimal(8, 2)
#

require 'rails_helper'

describe User do
  it { should have_many :assigned_projects}
  it { should have_many :work_times}
  it { should have_and_belong_to_many :projects}
  it { should validate_presence_of :email}
  it { should validate_presence_of :password}

  it 'create valid user' do
    user = User.new(
      email:    'test@test.com',
      password: 'qwer1234!'
    )
    expect(user).to be_valid

    user.save
    expect(User.last).to eq(user)
  end
end
