module FormHelper
  def collect_dictionary_parents(current_id)
    Dictionary.without_current(current_id).map{|d| [d.symbol, d.id]}
  end

  #duplicated in dictionaries_helper.rb
  def collect_kinds
    Dictionary.kinds.map{|k,_v| k}
  end

  def collect_projects_parents(current_id)
    Project.without_current(current_id).map{|d| [d.short_name, d.id]}
  end

  def collect_users
    User.all.map{|u| [u.full_name, u.id]}
  end

  def collect_work_time_activity
    WorkTime.get_activity.collect{|a| a.symbol}
  end
end