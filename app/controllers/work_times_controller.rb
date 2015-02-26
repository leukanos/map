class WorkTimesController < ApplicationController
  before_filter :set_arguments

  def index
    @work_time  = current_user.work_times.new
  end

  def create
    @work_time  = current_user.work_times.new(work_time_params)

    if @work_time.save
      flash[:success] = 'Dodano pozycję'
      redirect_to work_times_path
    else
      flash[:danger] = 'Wystąpił błąd podczas zapisywania'
      render :index
    end
  end

  def edit
    @work_time = WorkTime.find(params[:id])
  end

  private

  def work_time_params
    params.require(:work_time).permit(:project_id, :action, :form, :time, :date, :comment)
  end

  def set_arguments
    @work_times = current_user.work_times.order('date DESC', 'id DESC')
  end
end
