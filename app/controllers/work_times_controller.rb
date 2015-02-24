class WorkTimesController < ApplicationController
  def index
    @work_times = current_user.work_times.order('date DESC', :id)
    @work_time  = current_user.work_times.new
  end
end
