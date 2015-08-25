class JobsController < ApplicationController
  def index
    @jobs = JobDecorator.decorate_collection(Job.all)
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to(jobs_url)
    flash[:danger] = 'Job was successfully destroyed.'
  end
end
