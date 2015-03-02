class WorkTime < ActiveRecord::Base
  ### settings ###

  ### relations and scopes ###
  belongs_to :user
  belongs_to :project

  #### validations ###
  validates_presence_of :user_id, :project_id, :date, :time

  #### class methods ####
  def self.sum_time
  sum(:time)
  end

  def self.get_form
  Dictionary.form
  end

  def self.get_activity
  Dictionary.activity
  end

  #### object methods ###

end
