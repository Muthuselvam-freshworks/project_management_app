class ProjectsController < ApplicationController
    before_action :authenticate_user!
    
  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.build
  end
  def show
    @project = Project.find(params[:id])
  @invitation = @project.invitations.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to dashboard_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  

  private

  def project_params
    params.require(:project).permit(:project_name, :description)
  end
end
