module ProjectsHelper
  def collect_projects_parents(current_id)
    Project.without_current(current_id).map{|d| [d.short_name, d.id]}
  end

  def collect_users
    User.all.map{|u| [u.full_name, u.id]}
  end
end
