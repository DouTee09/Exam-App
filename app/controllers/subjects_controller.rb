class SubjectsController < ApplicationController
  before_action :logged_in, only: [:new, :create]
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

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:success] = "Subject updated successfully"
      redirect_to subjects_path
    else
      flash[:danger] = "Subject can't be updated"
      redirect_to subjects_path
    end

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

  def destroy
    @subject = Subject.find_by(id: params[:id])
    if @subject.destroy
      flash[:success] = "Subject successfully destroyed"
      redirect_to subjects_path
    else
      flash[:danger] = "Error while destroying"
      redirect_to subjects_path
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :content)
    end
end
