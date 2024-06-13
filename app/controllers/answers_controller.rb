class AnswersController < ApplicationController
  def index
    @answers = current_user.answers
  end

  def show
    @answers = current_user.answers.find_by_id(params[:id])
  end


  def new
    @subject = Subject.find_by_id(params[:subject_id])
    @exam = @subject.exams.find_by_id(params[:exam_id])
    @answer = @exam.answers.new
  end

  def create
    @subject = Subject.find_by_id(params[:subject_id])
    @exam = @subject.exams.find_by_id(params[:exam_id])
    @answer = @exam.answers.build(questions: JSON.parse(answer_params[:questions].to_json), user_id: current_user.id)

    if @answer.save!
      @answer.calculate_score
      flash[:success] = "Created answer successfully"
      redirect_to home_path
    else
      flash[:danger] = "Can't create answer"
      render :new
    end
  end

  private
    def answer_params
      params.require(:answer)
    end

end
