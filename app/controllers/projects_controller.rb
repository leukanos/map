class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_project, only: [:edit, :update, :destroy]


  def index
    @projects = Project.paginate(page: params[:page])
  end

  def new
    @project = Project.new
  end

  def create
    @project =  Project.new(project_params)
    if @project.save
      flash[:success] = 'Dodano projekt'
      redirect_to projects_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = 'Pomyślnie zmieniono projekt'
      redirect_to projects_url
    else
      flash[:danger] = 'Wystąpił błąd podczas zapisywania'
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = 'Projekt został usunięty.'
      redirect_to projects_path
    else
      flash[:danger] = 'Podczas usuwania występił błąd'
      redirect_to projects_path
    end
  end

  def project_params
    params.require(:project).permit(:short_name, :name, :assigned_to_id, :parent_id, user_ids: [])
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
