class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :get_users

  respond_to :html

  def index
    @tasks = Task.all.order(:finish_date)
    respond_with(@tasks)
  end

   def mytask
    @tasks = Task.all
    respond_with(@tasks)
    end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :time, :start_date, :finish_date, :user_id, :finished, :user_res)
    end

    def get_users
      @users = User.all.map { |user| [user.name,user.id] }
    end
end
