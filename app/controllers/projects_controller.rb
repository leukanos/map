class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create

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
end
