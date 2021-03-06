class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create

  	@job = Job.new(job_params)

    if @job.reviewer_id != current_reviewer.id
      redirect_to root_path
    else
      if @job.save
        redirect_to jobs_path
      else
        render 'new'
      end
    end
  end

  def index
  	@jobs = Job.all
    @reviewers = Reviewer.all
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.reviewer_id != current_reviewer.id
      render 'edit'
    else
      if @job.update(params[:job].permit(:company, :role, :startyear, :endyear, :reviewer_id))
        redirect_to jobs_path
      else
        render 'edit'
      end
    end
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
