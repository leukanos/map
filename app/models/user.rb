require 'role_model'

class User < ActiveRecord::Base
  include RoleModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  roles :admin, :manager, :user

  has_many :assigned_projects, class_name: 'Project', foreign_key: :assigned_to_id
  has_and_belongs_to_many :projects

  def full_name
    "#{firstname} #{lastname}"
  end
end
