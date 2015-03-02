class WorkTimesController < ApplicationController
  before_filter :set_arguments
  before_filter :set_work_time, only: [:edit, :destroy, :update]

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
  end

  def update
    if @work_time.update_attributes(work_time_params)
      flash[:success] = 'Zmiana przebiegła pomyślnie'
      redirect_to work_times_path
    else
      flash[:danger] = 'Podczas edycji występił błąd'
      redirect_to work_times_path
    end
  end

  def destroy
    if @work_time.destroy
      flash[:success] = 'Pomyślnie usunięto pozycję'
      redirect_to work_times_path
    else
      flash[:danger] = 'Wystąpił błąd podczas usuwania'
      render :index
    end
  end

  private

  def work_time_params
    params.require(:work_time).permit(:project_id, :action, :form, :time, :date, :comment)
  end

  def set_arguments
    @work_times = current_user.work_times.order('date DESC', 'id DESC')
  end

  def set_work_time
    @work_time = WorkTime.find(params[:id])
  end
end
