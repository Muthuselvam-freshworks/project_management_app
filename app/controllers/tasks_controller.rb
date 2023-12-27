class TasksController < ApplicationController
    before_action :set_project
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = @project.tasks
      @project = Project.find(params[:project_id])
      @task = @project.tasks.build
      @users = User.all
      
    end
  
    def show
    end
  
    def new
      @task = @project.tasks.build
      @users = User.all
    end
  
    def create
        @project = Project.find(params[:project_id])
      @task = @project.tasks.build(task_params)
  
      if @task.save
        redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
      else
        render :new
      end
    end
  
    def edit
        @users = User.all
       @task = Task.find(params[:id])
    end
  
    def update
      if @task.update(task_params)
        redirect_to project_tasks_path(@project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  
    def set_task
      @task = @project.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :description, :due_date, :user_id, :priority)
    end
  end
  