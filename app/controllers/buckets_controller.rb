class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end
  def new
    @bucket = Bucket.new
  end
  def create
    @bucket = Bucket.new(params[:bucket])
    if(@bucket.save)
      redirect_to bucket_tasks_path(@bucket), :notice=>"Bucket Created"
    else
      render :action=>:new
    end
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
