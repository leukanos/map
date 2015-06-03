# == Schema Information
#
# Table name: kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kind < ActiveRecord::Base
  ### settings ###

  ### relations and scopes ###
  has_many :work_times
  has_many :projects, through: :work_times

  #### validations ###
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  #### class methods ####

  #### object methods ###
  def to_s
    self.name.humanize
  end

  def color
    name.pastel_color
  end

end
