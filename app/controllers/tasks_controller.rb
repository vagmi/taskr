class TasksController < ApplicationController
  def index
    @bucket = Bucket.find(params[:bucket_id])
    @tasks = @bucket.tasks
  end
end
