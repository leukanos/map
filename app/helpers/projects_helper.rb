module ProjectsHelper
  def collect_projects
    Project.all.map{|d| [d.short_name, d.id]}
  end

  def collect_users
    User.all.map{|u| [u.full_name, u.id]}
  end
end
