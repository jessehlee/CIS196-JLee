class ReviewersController < ApplicationController
  def new
  	@reviewer = Reviewer.new
  end

  def create
  	@reviewer = Reviewer.new(reviewer_params)
  	if @reviewer.save
  		redirect_to reviewers_path
  	else
  		render 'new'
	end
  end

  def reviewer_params
  	params.require(:reviewer).permit(:name, :location)
  end

  def index
  	@reviewers = Reviewer.all
  end

  def edit
    @reviewer = Reviewer.find(params[:id])
  end

  def show
    @reviewer = Reviewer.find(params[:id])
  end

  def update
    @reviewer = Reviewer.find(params[:id])

    if @reviewer.update(params[:reviewer].permit(:name, :location))
      redirect_to reviewers_path
    else
      render 'edit'
    end
  end

  def destroy
    @reviewer = Reviewer.find(params[:id])
    @reviewer.destroy

    redirect_to reviewers_path
  end

end
