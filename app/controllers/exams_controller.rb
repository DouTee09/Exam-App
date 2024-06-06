class ExamsController < ApplicationController
  before_action :logged_in, :find_subject

  def new
    @exam = @subject.exams.new
  end

  def index
    @exams = @subject.exams
  end

  def create
    @exam = @subject.exams.build(name: exam_params[:name], questions: JSON.parse(exam_params[:questions].to_json))
    if @exam.save!
      flash[:success] = "Created exam successfully"
      redirect_to subject_exams_path
    else
      flash[:danger] = "Can't create exam"
      render :new
    end
  end

  def destroy
    @exam = @subject.exams.find_by(id: params[:id])
    if @exam.destroy
      flash[:success] = "Exam successfully destroyed"
      redirect_to subject_exams_path
    else
      flash[:danger] = "Error while destroying"
      redirect_to subject_exams_path
    end
  end

  def edit
    @exam = @subject.exams.find_by(id: params[:id])
  end

  def update
    @exam = @subject.exams.find_by(id: params[:id])
    if @exam.update!(name: exam_params[:name], questions: JSON.parse(exam_params[:questions].to_json))
      flash[:success] = "Exam updated successfully"
      redirect_to subject_exams_path
    else
      flash[:danger] = "Exam not updated successfully"
      redirect_to subject_exams_path
    end
  end

  private

  def find_subject
    @subject = Subject.find_by(id: params[:subject_id])
  end

  def exam_params
    params.require(:exam)
  end

end
