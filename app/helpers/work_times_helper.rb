module WorkTimesHelper
  def progress_bar_class

    r = current_user.percentage_realization.to_f
    if r < 15
      "progress-bar-danger"
    elsif r >= 15 && r < 45
      "progress-bar-warning"
    elsif r >= 45 && r < 85
      "progress-bar-info"
    else
      "progress-bar-success"
    end
  end
end
