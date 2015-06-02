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

require 'role_model'

class User < ActiveRecord::Base
  ### settings ###
  include RoleModel

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  roles :admin, :manager, :user

  ### relations and scopes ###
  has_many :assigned_projects, class_name: 'Project', foreign_key: :assigned_to_id
  has_many :work_times
  has_and_belongs_to_many :projects

  #### validations ###

  #### class methods ####

  #### object methods ####
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
