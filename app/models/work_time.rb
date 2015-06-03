# == Schema Information
#
# Table name: work_times
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  form       :string(255)
#  action     :string(255)
#  date       :date
#  time       :decimal(10, )
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WorkTime < ActiveRecord::Base
  ### settings ###

  ### relations and scopes ###
  belongs_to :user
  belongs_to :project
  belongs_to :kind

  #### validations ###
  validates_presence_of :user_id, :project_id, :date, :time

  #### class methods ####
  def self.sum_time
  sum(:time)
  end

  #### object methods ###

end
