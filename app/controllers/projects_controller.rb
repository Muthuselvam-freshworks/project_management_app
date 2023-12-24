class ProjectsController < ApplicationController
    before_action :authenticate_user!
    
  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to dashboard_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # Other actions: show, edit, update, destroy

  private

  def project_params
    params.require(:project).permit(:project_name, :description)
  end
end
