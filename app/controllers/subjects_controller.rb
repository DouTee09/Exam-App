class SubjectsController < ApplicationController
  before_action :logged_in


  def new
    @subject = Subject.new
  end

  def index
    @subject = Subject.new
    @subjects = Subject.page(params[:page]).per(5)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = current_user.subjects.build(subject_params)
    @subjects = Subject.page(params[:page]).per(5)
    if @subject.save
      flash[:success] = "Created subject !!!"
      redirect_to subjects_path
    else
      flash[:danger] = "Can't create a new subject"
      render :index
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:name)
    end
end
