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