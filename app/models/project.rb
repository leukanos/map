# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  short_name     :string(25)
#  state          :string(255)
#  closing_date   :date
#  ancestry       :string(255)
#  assigned_to_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Project < ActiveRecord::Base
  ### settings ###
  has_ancestry
  self.per_page = 10

  ### relations and scopes ###
  belongs_to :assigned_to, class_name: 'User'
  has_and_belongs_to_many :users
  has_many :work_times
  has_many :kinds, through: :work_times

  scope :without_current, ->(current_id) {where('id <> ?', current_id || 0)}

  #### validations ###
  validates_presence_of   :short_name
  validates_uniqueness_of :short_name

  #### object methods ###
  def to_s
    self.short_name
  end
end
