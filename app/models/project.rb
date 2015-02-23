class Project < ActiveRecord::Base
  has_ancestry

  belongs_to :assigned_to, class_name: 'User'

  scope :without_current, ->(current_id) {where('id <> ?', current_id || 0)}

  validates_presence_of :short_name
end
