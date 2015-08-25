class JobsController < ApplicationController
  def index
    @jobs = JobDecorator.decorate_collection(Job.all)
  end

  def show
    @job = Job.find(params[:id])
  end
end
