class TasksController < ApplicationController
  def index
    if(params[:bucket_id])
      @bucket = Bucket.find(params[:bucket_id])
      @tasks = @bucket.tasks
      @task = @bucket.tasks.build
    else
      @tasks = Task.all
    end
  end
  def create
    @bucket = Bucket.find(params[:bucket_id])
    @tasks = @bucket.tasks
    @task = Task.new(params[:task])
    if(@task.save)
      redirect_to bucket_tasks_path(@bucket)
    else
      render :action=>:index
    end
  end
  def complete
  end
end
