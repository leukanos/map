require 'role_model'

class User < ActiveRecord::Base
  include RoleModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  roles :admin, :manager, :user

  def full_name
    "#{firstname} #{lastname}"
  end
end
