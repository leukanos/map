class Dictionary < ActiveRecord::Base
  ### settings ###
  has_ancestry
  enum kind: [ :form, :activity ]

  ### relations and scopes ###
  scope :without_current, ->(current_id) {where('id <> ?', current_id || 0)}

  #### validations ###
  validates_presence_of :kind, :symbol

  #### class methods ####
  def self.create_with_parent(params = {})

    parent_id = params.delete('parent')
    parent = Dictionary.find(parent_id) if parent_id

    @dictionary = Dictionary.new(params.merge(parent: parent))
    if @dictionary.save
      true
    else
      false
    end

  end

  #### object methods ####
  def full_symbol
    if parent
      "#{parent.andand.symbol}: #{symbol}"
    else
      symbol
    end
  end

end
