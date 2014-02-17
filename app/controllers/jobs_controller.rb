class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create

  	@job = Job.new(job_params)

  	if @job.save
  		redirect_to jobs_path
	  else
		render 'new'
    end
  end

  def index
  	@jobs = Job.all
  end

  def edit
    @job = Job.find(params[:id])
  end

  def show
    @job = Job.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(:company, :role, :startyear, :endyear, :reviewer_id)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path
  end

end
