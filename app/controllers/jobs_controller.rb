class JobsController < ApplicationController
  def index
    @jobs = JobDecorator.decorate_collection(Job.all)

    respond_to do |format|
      format.html
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
end
