class WorkTime < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :user_id, :project_id, :date, :time


  def self.sum_time
    sum(:time)
  end
end
