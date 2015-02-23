class Dictionary < ActiveRecord::Base
  has_ancestry

  scope :without_current, ->(current_id) {where('id <> ?', current_id || 0)}

  validates_presence_of :kind, :symbol

  enum kind: [ :form, :activity ]

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

  def full_symbol
    if parent
      "#{parent.andand.symbol}: #{symbol}"
    else
      symbol
    end
  end

end
