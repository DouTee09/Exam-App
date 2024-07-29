class ExamsController < ApplicationController
  before_action :logged_in, :find_subject

  def new
    @exam = @subject.exams.new
  end

  def failed_save
    @exam = @subject.exams.new exam_params
  end

  def failed_update
    @exam = @subject.exams.find_by(id: params[:id])
  end

  def index
    @exams = @subject.exams
  end

  def create
    @exam = @subject.exams.build(name: exam_params[:name], time: exam_params[:time], questions: JSON.parse(exam_params[:questions].to_json))

    if @exam.save
      flash[:success] = "Created exam successfully"
      redirect_to subject_exams_path
    else
      render "failed_save"
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
    if @exam.update(name: exam_params[:name], time: exam_params[:time], questions: JSON.parse(exam_params[:questions].to_json))
      flash[:success] = "Exam updated successfully"
      redirect_to subject_exams_path
    else
      render "failed_update"
    end
  end

  def show
    @exam = @subject.exams.find_by(id: params[:id])
  end

  def new_import
  end

  def import
    if params[:import_exam] && params[:import_exam][:file]
      ImportFileExam.new(params[:import_exam][:file]).import
      redirect_to home_path
      flash[:success] = "Import successfully"
    else
      redirect_to home_path
      flash[:danger] = "Import failed"
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
