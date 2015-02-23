module AdminHelper
  def collect_parents
    Dictionary.all.map{|d| [d.symbol, d.id]}
  end

  def collect_kinds
    Dictionary.kinds.map{|k,v| k}
  end
end