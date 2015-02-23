class Project < ActiveRecord::Base
  has_ancestry

  belongs_to :assigned_to, class_name: 'User'
end
