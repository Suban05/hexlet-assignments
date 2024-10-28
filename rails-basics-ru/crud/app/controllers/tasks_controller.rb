class TasksController < ApplicationController
  before_action :set_task, only: %i[:edit update show destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.build(task_params)
    if @task.save
      flash[:success] = "ok"
      redirect_to task_path(@task)
    else
      flash[:failure] = "error"
      render :new
    end   
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "ok"
      redirect_to task_path(@task)
    else
      flash[:failure] = "error"
      render :edit
    end
  end

  def show 
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was successfully deleted"
      redirect_to tasks_path
    else
      flash[:failure] = "Task cannot be deleted"
      redirect_to 
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :permormer, :completed)
  end
end
