class WorkTimesController < ApplicationController
  def index
    @work_times = current_user.work_times
  end
end
