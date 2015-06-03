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
    self.name
  end

end
