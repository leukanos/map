module AdminHelper
  def collect_dictionary_parents(current_id)
    Dictionary.without_current(current_id).map{|d| [d.symbol, d.id]}
  end

  def collect_kinds
    Dictionary.kinds.map{|k,v| k}
  end
end