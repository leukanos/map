class Project < ActiveRecord::Base
  ### settings ###
  has_ancestry
  self.per_page = 10

  ### relations and scopes ###
  belongs_to :assigned_to, class_name: 'User'
  has_and_belongs_to_many :users
  has_many :work_times

  scope :without_current, ->(current_id) {where('id <> ?', current_id || 0)}

  #### validations ###
  validates_presence_of   :short_name
  validates_uniqueness_of :short_name
end
