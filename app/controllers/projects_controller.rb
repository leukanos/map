class ProjectsController < ApplicationController

  def index
    @projects = Project.all
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
    @project = Project.find(params[:id])
  end

  def update

  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = 'Projekt został usunięty.'
      redirect_to project_path
    else
      flash[:danger] = 'Podczas usuwania występił błąd'
      redirect_to project_path
    end
  end

  def project_params
    params.require(:project).permit(:short_name, :name, :assigned_to_id, :parent_id)
  end
end
