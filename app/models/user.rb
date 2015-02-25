require 'role_model'

class User < ActiveRecord::Base
  include RoleModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  roles :admin, :manager, :user

  has_many :assigned_projects, class_name: 'Project', foreign_key: :assigned_to_id
  has_many :work_times
  has_and_belongs_to_many :projects

  def full_name
    "#{firstname} #{lastname}"
  end

  def complex_name
    "#{firstname} #{lastname} - #{email}"
  end

  def sum_time
    work_times.sum_time
  end

  def percentage_realization
    if limit
      p = sum_time/limit * 100
      p = p.round(2)
    end
    p ||= 0

    p = 100 if p > 100

    "#{p}%"
  rescue
    '0%'
  end
end
